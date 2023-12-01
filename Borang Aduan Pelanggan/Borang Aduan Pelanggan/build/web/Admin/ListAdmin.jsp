<%-- 
    Document   : ListAdmin
    Created on : Nov 29, 2023, 2:33:46 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="navigation.jsp"/>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sistem Aduan Pelanggan</title>
    <link rel="stylesheet" href="style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<style>
    .modal {
        display: none;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
        justify-content: center;
        align-items: center;
    }

    .modal-content {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        max-width: 420px; /* Adjust the maximum width as needed */
        margin: 0 auto; /* Center the modal horizontally */
    }

    .modal-content .close {
        position: absolute;
        top: 10px;
        right: 10px;
        font-size: 20px;
        cursor: pointer;
    }

    /* Adjust form styles for vertical layout */
    #registrationForm {
        display: flex;
        flex-direction: column;
    }

    .input-box {
        margin-bottom: 20px;
        position: relative;
        width: 100%;
        height: 40px;
    }

    .input-box label {
        margin-bottom: 5px;
    }

    .input-box input {
        width: 100%;
        height: 100%;
        background: transparent;
        border: none;
        outline: none;
        border: 4px solid rgba(0, 0, 0, 0.1);
        border-radius: 40px;
        font-size: 16px;
        color: black;
        padding: 10px 20px;
    }

    .input-box i {
        position: absolute;
        right: 20px;
        top: 90%;
        transform: translateY(-50%);
        font-size: 20px;
    }

    
    /*button tambah admin*/
    .button-containers {
        display: flex;
        align-items: center; /* Align items vertically in the center */
    }

    .btn-add-new {
        width: 100px;
        height: 40px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        font-size: 16px;
        margin-left: 1150px; /* Push the button to the right */
        margin-bottom: 7px; /* Add top margin as needed */
    }

    .btn-admin-baru:hover {
        background-color: #0056b3; /* Choose your desired hover background color */
    }
    
    /*button register and cancel*/
    .buttons-container {
        display: flex;
        justify-content: space-between;
        margin-top: 10px; /* Adjust the margin as needed */
    }
    
    .button-containers search-container{
        margin-right: 400px;
    }

    /*button register*/
    button[type="submit"] {
        width: 150px;
        height: 40px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 20px; /* Set border-radius to half of the height to make it oval */
        cursor: pointer;
        font-size: 16px;
        outline: none;
    }
    
    button[type="cancel"] {
        width: 150px;
        height: 40px;
        background-color: red;
        color: white;
        border: none;
        border-radius: 20px; /* Set border-radius to half of the height to make it oval */
        cursor: pointer;
        font-size: 16px;
        outline: none;
    }


</style>
 
    <body>
    <div class="container">
        <div class="tbl-container">
            <h2>Senarai admin sistem</h2>            
            <div class="search-container">  
                <form id="searchForm" onsubmit="searchFunction(); return false;">
                    <input type="text" id="searchInput" placeholder="Carian..." oninput="filterDocuments()">
                    <button type="find" class="search">Carian</button>
                </form>
            </div>
            <br>
            <button class="btn-add-new" onclick="openModal()"> +  Admin Baru</button>
<!--            <div id="noResultsMessage">Carian tidak wujud</div>-->
            
            <br>
            <table class="tbl">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Penuh</th>
                        <th>Nama Pengguna</th>
                        <th>E-mel</th>
                        <th>No Telefon</th>
                        <th colspan="2">Paparan</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <button class="btn-edit" onclick="editFunction(this)"><i class='bx bxs-edit'></i></button>
                        </td>
                        <td>
                            <button class="btn-delete" onclick="deleteFunction(this)"><i class="fa fa-trash"></i></button>
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <button class="btn-edit" onclick="editFunction(this)"><i class='bx bxs-edit'></i></i></button>
                        </td>
                        <td>
                            <button class="btn-delete" onclick="deleteFunction(this)"><i class="fa fa-trash"></i></button>
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td>
                            <button class="btn-edit" onclick="editFunction(this)"><i class='bx bxs-edit'></i></i></button>
                        </td>
                        <td>
                            <button class="btn-delete" onclick="deleteFunction(this)"><i class="fa fa-trash"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <!-- Modal for adding a new admin -->
            <div id="myModal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>Daftar akaun</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <!-- Registration form for a new admin -->
                        <form id="registrationForm" onsubmit="submitForm()">
                            <div class="input-box">
                                <label>Nama Penuh</label>
                                <input type="text" id="fullname" value="">  
                                <i class='bx bx-user'></i>             
                            </div>
                            <div class="input-box">
                                <label>Nama Pengguna</label>
                                <input type="text" id="username" value="">  
                                <i class='bx bx-user'></i>                  
                            </div>
                            <div class="input-box">
                                <label>No Telefon</label>
                                <input type="text" id="phoneNo" value="">  
                                <i class='bx bxs-phone'></i>             
                            </div>
                            <div class="input-box">
                                <label>Alamat E-mel</label>
                                <input type="text" id="email" value="">  
                                <i class='bx bx-envelope'></i>             
                            </div>
                            <div class="input-box">
                                <label>Kata laluan</label>
                                <div class="password-input">
                                    <input type="password" id="password" value="">
                                    <i class='bx bx-hide' id="togglePassword"></i>
                                </div>
                                <i class='bx bxs-lock-alt'></i>
                            </div>
                            <div class="input-box">
                                <label>Sahkan kata laluan</label>
                                <div class="password-input">
                                    <input type="password" id="Repassword" value="">
                                    <i class='bx bx-hide' id="toggleRepassword"></i>
                                </div>
                                <i class='bx bxs-lock-alt'></i>
                            </div>
                            <div class="buttons-container">
                                <button type="cancel" class="cancel-button" onclick="closeModal()">Cancel</button>
                                <button type="submit" class="register-button">Register</button>                               
                            </div>
                        </form>
                    </div>                    
                </div>
            </div>
        </div>
    </div>

            <script>
                
            var rowNumber = 1;

            // Function to increment the row number
            function getNextRowNumber() {
                return rowNumber++;
            }
            
            // Function to filter documents based on the search input
            function filterDocuments() {
                var input, filter, table, tr, td, i, txtValue, noResultsMessage;
                input = document.getElementById("searchInput");
                filter = input.value.toUpperCase();
                table = document.getElementsByClassName("tbl")[0]; // Assuming the table has the class "tbl"
                tr = table.getElementsByTagName("tr");
                noResultsMessage = document.getElementById("noResultsMessage");

                var resultsFound = false;

                for (i = 0; i < tr.length; i++) {
                    td = tr[i].getElementsByTagName("td")[1]; // Assuming you want to filter based on the second column (index 1)
                    if (td) {
                        txtValue = td.textContent || td.innerText;
                        if (txtValue.toUpperCase().indexOf(filter) > -1) {
                            tr[i].style.display = "";
                            resultsFound = true;
                        } else {
                            tr[i].style.display = "none";
                        }
                    }
                }

                // Display no results message if applicable
                if (!resultsFound) {
                    noResultsMessage.style.display = "block";
                } else {
                    noResultsMessage.style.display = "none";
                }
            }


            // Function to handle form submission (optional)
            function searchFunction() {
                // You can add additional logic here if needed
                // For example, you might want to submit the form to a server or perform other actions.
            }

            // Function to handle edit button click
            function editFunction(button) {
                var row = button.closest("tr");

                var cells = row.getElementsByTagName("td");
                var rowData = [];
                for (var i = 0; i < cells.length; i++) {
                    rowData.push(cells[i].innerText);
                }

                var editPageUrl = "GenerateForm.html";

                window.location.href = editPageUrl;
            }

            // Function to handle delete button click
            function deleteFunction(button) {
                var confirmation = confirm("Are you sure you want to delete this record?");
                if (confirmation) {
                    var row = button.closest("tr");
                    row.remove();
                    // You can add additional logic here for deleting the record permanently or updating the server.
                }
            }
            
            //For add new admin
            function addNewAdmin() {
               
            }
            
            // Function to open the modal
        function openModal() {
            var modal = document.getElementById('myModal');
            modal.style.display = 'flex'; // Display the modal
        }

        // Function to close the modal
        function closeModal() {
            var modal = document.getElementById('myModal');
            modal.style.display = 'none'; // Hide the modal
        }

        // Function to handle form submission
        function submitForm() {
            // Add your logic for handling the form submission
            closeModal(); // Close the modal after submission
            return false; // Prevent form submission (you can customize this based on your needs)
        }
        
       
        </script>  
        
    </body>
</html>
