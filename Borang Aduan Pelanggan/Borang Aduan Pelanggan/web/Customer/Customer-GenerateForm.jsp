<%-- 
    Document   : Customer-GenerateForm
    Created on : Nov 8, 2023, 2:49:30 PM
    Author     : USER
--%>

<%@page import="java.sql.Date"%>
<%@page import="database.MySQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--    <link rel="stylesheet" href="receipt.css">-->
    <title>Form</title>

    <style>
        @media print {
            #printPageButton {
                display: none;
            }
        }
        
        /* CSS */
        .button-60 {
            align-items: center;
            appearance: none;
            background-color: #fff;
            border: 1px solid #dbdbdb;
            border-radius: .375em;
            box-shadow: none;
            box-sizing: border-box;
            color: #363636;
            cursor: pointer;
            display: inline-flex;
            font-family: BlinkMacSystemFont,-apple-system,"Segoe UI",Roboto,Oxygen,Ubuntu,Cantarell,"Fira Sans","Droid Sans","Helvetica Neue",Helvetica,Arial,sans-serif;
            font-size: 1rem;
            height: 2.5em;
            justify-content: center;
            line-height: 1.5;
            padding: calc(.5em - 1px) 1em;
            position: relative;
            text-align: center;
            user-select: none;
            -webkit-user-select: none;
            touch-action: manipulation;
            vertical-align: top;
            white-space: nowrap;
        }

        .button-60:active {
            border-color: #4a4a4a;
            outline: 0;
        }

        .button-60:focus {
            border-color: #485fc7;
            outline: 0;
        }

        .button-60:hover {
            border-color: #b5b5b5;
        }

        .button-60:focus:not(:active) {
            box-shadow: rgba(72, 95, 199, .25) 0 0 0 .125em;
        }
        
        
        
        
        * {
            margin: 0;
            padding: 0;
            font-family: "Times New Roman", Times, serif;
            box-sizing: border-box;
            font-size: 24px;
            font-weight: normal;
        }   

        img {
            max-width: 100%;
        }

        body {
            -webkit-font-smoothing: antialiased;
            -webkit-text-size-adjust: none;
            width: 100% !important;
            height: 100%;
            line-height: 1.6;
        }

        /* Let's make sure all tables have defaults */
        table td {
            vertical-align: top;
        }

        /* -------------------------------------
            BODY & CONTAINER
        ------------------------------------- */
        body {
            background-color: #f6f6f6;
        }

        .body-wrap {
            background-color: #f6f6f6;
            width: 100%;
            height: 100%
        }

        .container {
            display: block !important;
            max-width: 1240px !important;
            margin: 0 auto !important;
            /* makes it centered */
            clear: both !important;
        }

        .content {
            max-width: 1240px;
            margin: 0 auto;
            display: block;
            padding: 0px;
        }

        /* -------------------------------------
            HEADER, FOOTER, MAIN
        ------------------------------------- */
        .main {
            background: #fff;
        }

        .content-wrap {
            padding: 20px;
        }

        .content-block {
            padding: 0 0 20px;
            padding-top: 10px;
            padding-bottom: 0px;
        }

        .header {
            width: 100%;
            margin-bottom: 20px;
        }

        .footer {
            width: 100%;
            clear: both;
            color: #999;
            padding: 20px;
        }
        .footer a {
            color: #999;
        }
        .footer p, .footer a, .footer unsubscribe, .footer td {
            font-size: 12px;
        }

        /* -------------------------------------
            TYPOGRAPHY
        ------------------------------------- */
         h2{
            font-family: "Helvetica Neue", Helvetica, Arial, "Lucida Grande", sans-serif;
            color: #000;
            margin: 40px 0 0;
            line-height: 1.2;
            font-weight: 400;
        }


        h2 {
            font-size: 45px;
            font-weight: 600;
        }




        p, ul, ol {
            margin-bottom: 10px;
            font-weight: normal;
        }
        p li, ul li, ol li {
            margin-left: 5px;
            list-style-position: inside;
        }

        /* -------------------------------------
            LINKS & BUTTONS
        ------------------------------------- */
        a {
            color: #1ab394;
            text-decoration: underline;
        }

        .btn-primary {
            text-decoration: none;
            color: #FFF;
            background-color: #1ab394;
            border: solid #1ab394;
            border-width: 5px 10px;
            line-height: 2;
            font-weight: bold;
            text-align: center;
            cursor: pointer;
            display: inline-block;
            border-radius: 5px;
            text-transform: capitalize;
        }

        /* -------------------------------------
            OTHER STYLES THAT MIGHT BE USEFUL
        ------------------------------------- */
        .last {
            margin-bottom: 0;
        }

        .first {
            margin-top: 0;
        }

        .aligncenter {
            text-align: center;
        }

        .alignright {
            text-align: right;
        }

        .alignleft {
            text-align: left;
        }

        .clear {
            clear: both;
        }

        /* -------------------------------------
            ALERTS
            Change the class depending on warning email, good email or bad email
        ------------------------------------- */
        .alert {
            font-size: 16px;
            color: #fff;
            font-weight: 500;
            padding: 20px;
            text-align: center;
            border-radius: 3px 3px 0 0;
        }
        .alert a {
            color: #fff;
            text-decoration: none;
            font-weight: 500;
            font-size: 16px;
        }
        .alert.alert-warning {
            background: #f8ac59;
        }
        .alert.alert-bad {
            background: #ed5565;
        }
        .alert.alert-good {
            background: #1ab394;
        }

        /* -------------------------------------
            INVOICE
            Styles for the billing table
        ------------------------------------- */
        .invoice {
            margin: 40px auto;
            text-align: left;
            width: 95%;
        }
        .invoice td {
            padding: 5px 0;
        }
        .invoice .invoice-items {
            width: 100%;
        }
        .invoice .invoice-items td {
            border-top: #eee 1px solid;
        }
        .invoice .invoice-items .total td {
            border-top: 2px solid #333;
            border-bottom: 2px solid #333;
            font-weight: 700;
        }
        
        td {
           padding: 5px;
        }

        /* -------------------------------------
            RESPONSIVE AND MOBILE FRIENDLY STYLES
        ------------------------------------- */
        @media only screen and (max-width: 640px) {
             h2 {
                font-weight: 600 !important;
                margin: 20px 0 5px !important;
            }

            h1 {


            h2 {
                font-size: 18px !important;
            }



            .container {
                width: 100% !important;
            }

            .content, .content-wrap {
                padding: 10px !important;
            }

            .invoice {
                width: 100% !important;
            }
            }
        }
        
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
          th, td {
            padding: 5px;
            text-align: left;
          }
            </style>
        </head>
        <body>


    <%
        String customerName = null;        
        String customerEmail = null;
        String customerID = null;
        String customerPhoneNumber = null;
        String buildingNo = null;
        String dateComplaint = null;
        String detailsComplaint = null;
        String sourceComplaint = null;
        Date date = null;
        
        Connection con = null;
        PreparedStatement ps = null;
        int total = 1;
        try {
            Class.forName("com.mysql.jdbc.Driver");
                            con = MySQL.getConnection();
            String sql = "SELECT * FROM form WHERE customerID = \"" + customerID + "\" ";
            ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                customerName = rs.getString("customerName");                
                customerEmail = rs.getString("customerEmail");
                customerID = rs.getString("customerID");
                customerPhoneNumber = rs.getString("customerPhoneNumber");
                buildingNo = rs.getString("buildingNo");              
                detailsComplaint = rs.getString("detailsComplaint");
                sourceComplaint = rs.getString("sourceComplaint");        
                dateComplaint = rs.getString("dateComplaint");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }


    %>

    <div class = "body wrap">
        <div class="container" style="width: 1150px;" height="1754px;">
            <div class="content">
                <div class="main">
                    <div class="content-wrap aligncenter" >
                        <div class="content-block">
                            <img src="../images/JATA NEGARA.jpg" width="80%" height="140" alt="alt" />
                            <h2>BORANG ADUAN PELANGGAN</h2>
                            <div style="padding-left:800px; text-align: left;">
                                <br>LAMPIRAN 1
                            </div>

                            <div class="invoice">                               
                                <br />NAMA PELANGGAN    : <%=customerName%>
                                <br />NO.PENDAFTARAN/KP : <%=customerID%>
                                <br />NO.TELEFON        : <%=customerPhoneNumber%>
                                <br />ALAMAT E-MEL      : <%=customerEmail%>
                                <br />ALAMAT            : <%=buildingNo%>
                                
                                
                                        <div class="content-block" style="padding-top: 380px;">                       
                                            <img src="../images/footer.png" width="95%" height="90px" alt="alt" />  
                                            <p style="text-align: center;">This form generated by computer. No signatures needed.</p>
                                            <br /><br />
                                            <button id="printPageButton" class="button-60" onclick="window.print()">Print Receipt</button>
                                        </div>
                            </div>
                        </div>
                    </div>                   
                </div>
            </div>
        </div>
    </div>

    </body>
</html>