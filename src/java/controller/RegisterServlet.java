/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.DAO.DAO;
import model.DTO.AccountDTO;
import model.DTO.CartDTO;
import org.apache.catalina.ant.SessionsTask;
import utils.UserError;

/**
 *
 * @author Admin
 */
public class RegisterServlet extends HttpServlet {

    private static final String SUCCESS = "login.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException, ClassNotFoundException {
        response.setContentType("text/html;charset=UTF-8");
        UserError userError = new UserError();
        String url = SUCCESS;
        String button = request.getParameter("action");
        String register = request.getParameter(("Register"));
        if(button.equals("Register")){
        try {
            DAO dao = new DAO();
            boolean checkValidation = true;
            int userID = dao.generateRandomUserID();
            String firstName = request.getParameter("firstName");
            HttpSession session = request.getSession();
            session.setAttribute("firstName", firstName);
            String lastName = request.getParameter("lastName");
            String phoneNumber = request.getParameter("phoneNumber");
            String shippingAddress = request.getParameter("shippingAddress");
            String password = request.getParameter("password");
            String username = request.getParameter("username");
            String email = request.getParameter("email");

            if (dao.isEmailExist(email)) {
                userError.setError("Email is exist!");
                request.setAttribute("USER_ERROR", userError);
                
            } else {
                if (checkValidation) {
                    dao.insertUserIDIntoPaymentCardInfo(userID);
                    dao.insertUserIDIntoCart(userID);
                    boolean checkInsert = dao.registerAccount(userID, password, username, email);
                    dao.registerUser(userID, firstName, lastName, phoneNumber, shippingAddress);
                    if (checkInsert) {
                        url = SUCCESS;
                    } else {
                        userError.setError("Register error!");
                        request.setAttribute("USER_ERROR", userError);
                    }
                } else {
                    request.setAttribute("USER_ERROR", userError);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
