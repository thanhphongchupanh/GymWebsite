    <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Verify OTP</title>     
            <%@include file="layout/header.jsp" %> 
            <link rel="stylesheet" href="css/wheyList.css">
            <style>
                * {
                    margin: 0;
                    padding: 0;
                    box-sizing: border-box;
                    font-family: 'Poppins', sans-serif;
                }
                .center-text {
                    text-align: center;
                    font-size: 30px;
                    margin-top: 20px; /* Điều chỉnh khoảng cách trên */
                    margin-bottom: 20px; /* Điều chỉnh khoảng cách dưới */
                    padding-left: 10px;
                }
                .container {
                    display: flex;
                    flex-direction: column;
                    align-items: center; /* Căn giữa chiều ngang */
                    justify-content: center; /* Căn giữa chiều dọc */
                    height: 40vh; /* Để khung được căn giữa trên cả màn hình */
                }

                .input-box {
                    width: 75%; /* Điều chỉnh độ rộng của ô input */
                    height: 40px; /* Điều chỉnh chiều cao của ô input */
                    border-bottom: 2px solid var(--gray);
                }
                .input-box input {
                    width: 140%; /* Điều chỉnh độ rộng của ô input */
                    height: 50px; /* Điều chỉnh chiều cao của ô input */
                    border: 1px solid black; /* Thêm khung đen xung quanh ô input */
                    padding: 0 100px 0 5px;
                    margin-right: 10px;
                    font-size: 14px;
                }

                .btn {
                    width: 40%; /* Độ rộng của nút Send OTP sẽ tự điều chỉnh */
                    height: 35px;
                    border-radius: 3px;
                    border: 0.5px solid black;
                    font-weight: 500;
                    color: var(--header);
                    cursor: pointer;
                    margin-top: 40px;
                    margin-left: 95px;
                    font-size: 15px;
                }

            </style>
        </head>
        <body>
            <div class="container">
                <div class="center-text">
                    <h2>Verify OTP</h2>
                </div>
                <form action="ValidOTP" method="post">
                    <div class="input-box">
                        <span class="icon">
                            <ion-icon name="mail-outline"></ion-icon>
                        </span>
                        <input type="text" id="otp" name="txtOTP" placeholder="Enter your OTP here!" required>                
                    </div>

                    <button type="submit" class="btn" name="action" value="VerifyOTP">Send</button>
                </form>
                <% 
                String errorMessage = (String) request.getAttribute("errorMessage"); // Lấy thông báo lỗi từ request
                if (errorMessage != null) {
            %>
                <div style="color: red; text-align: center; margin-top: 10px;">
                    <%= errorMessage %> 
                </div>
            <% 
                }
            %>
            </div>
            <footer>
                <%@include file="layout/footer.jsp" %>   
            </footer>


        </body> 


    </html>