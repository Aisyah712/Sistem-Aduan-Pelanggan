<%-- 
    Document   : MaklumatAduan
    Created on : Nov 23, 2023, 12:25:58 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="navigation.jsp"/>
<!DOCTYPE html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Sistem Aduan Pelanggan</title>
    <link rel="stylesheet" href="style.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
    <body>
    <div class="container">
        <div class="tbl-container">
            <h2>Maklumat Borang Aduan Pelanggan </h2>
            <div class="search-container">
                <form id="searchForm">
                    <input type="text" id="searchInput" placeholder="Carian..." oninput="filterDocuments()">
                    <button type="button" class="search" onclick="filterDocuments()">Carian</button>
                </form>
            </div>
            
<!--            <div id="noResultsMessage">Carian tidak wujud</div>-->
            
            <br>
            <table class="tbl">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Pelanggan</th>
                        <th>No Pendaftaran/Kp</th>
                        <th>No Telefon</th>
                        <th colspan="2">Paparan</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>1.</td>
                        <td>Siti Aisyah</td>
                        <td>001207-06-0284</td>
                        <td>017-9136064</td>
                        <td>
                            <button class="btn-edit" onclick="editFunction(this)"><i class='bx bx-detail'></i></button>
                        </td>
                        <td>
                            <button class="btn-delete" onclick="deleteFunction(this)"><i class="fa fa-trash"></i></button>
                        </td>
                    </tr>

                    <tr>
                        <td>2.</td>
                        <td>Aina Raha</td>
                        <td>000803-06-0124</td>
                        <td>017-9687913</td>
                        <td>
                            <button class="btn-edit" onclick="editFunction(this)"><i class='bx bx-detail'></i></button>
                        </td>
                        <td>
                            <button class="btn-delete" onclick="deleteFunction(this)"><i class="fa fa-trash"></i></button>
                        </td>
                    </tr>

                    <tr>
                        <td>3.</td>
                        <td>Muhammad Mifzal</td>
                        <td>000825-03-0823</td>
                        <td>019-9350656</td>
                        <td>
                            <button class="btn-edit" onclick="editFunction(this)"><i class='bx bx-detail'></i></button>
                        </td>
                        <td>
                            <button class="btn-delete" onclick="deleteFunction(this)"><i class="fa fa-trash"></i></button>
                        </td>
                    </tr>
                </tbody>
            </table>
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
        </script>  
    </body>
</html>
