/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.DAO.DAO;
import model.DTO.DTO;
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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserError userError = new UserError();
        String url = "";
        try {
            DAO dao = new DAO();
            boolean checkValidation = true;
            String userID = request.getParameter("userID");
            String username = request.getParameter("username");
            String roleID = request.getParameter("role");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            
            if (userID.length() < 2 || userID.length() > 20) {
                userError.setUserIDError("UserID must be in [2,20]");
                checkValidation = false;
            }

            if (username.length() < 5 || username.length() > 20) {
                userError.setFullNameError("username must be in [5,20]");
                checkValidation = false;
            }
            
            if(email.length()< 5 || email.length() > 30){
                userError.setEmailError("email must be in [5,30]");
                checkValidation = false;
            }
            
            if (checkValidation) {
                DTO user = new DTO(userID, username, password, roleID, email);
                boolean checkInsert = dao.register(user);
                if (checkInsert) {
                    url = SUCCESS;
                } else {
                    userError.setError("Unknow error!");
                    request.setAttribute("USER_ERROR", userError);
                }
            } else {
                request.setAttribute("USER_ERROR", userError);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
