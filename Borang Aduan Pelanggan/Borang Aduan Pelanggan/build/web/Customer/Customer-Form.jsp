<%-- 
    Document   : Customer-Form.jsp
    Created on : Nov 8, 2023, 9:22:52 AM
    Author     : USER
--%>

<%@page import="dao.FormDao"%>
<%@page import="database.MySQL"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="model.Form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:include page="bootstrap.jsp"/>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <style>
        body {
            border: 2px solid #ccc;
            padding: 20px;
        }

        .form-control {
            font-size: 16px;
            padding: 10px;
            border-radius: 10px;
            text-align: left;
            margin-bottom: 10px;
        }

        .larger-input {
            font-size: 16px;
            padding: 10px;
            border-radius: 10px;
            width: 500px;
            flex-basis: 60%;
            margin-bottom: 10px; /* Adjusted margin */
        }

        .larger-input1 {
            font-size: 16px;
            padding: 10px;
            border-radius: 10px;
            width: 300px;
            margin-bottom: 10px; /* Adjusted margin */
        }

        .larger-input3 {
            font-size: 16px;
            padding: 10px;
            border-radius: 10px;
            width: 300px;
            max-width: 300px;
            margin-bottom: 20px; /* Adjusted margin */
        }

        .flex-container {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px; /* Adjusted margin */
        }

        header {
            font-size: 30px;
            padding: 5px;
            margin-bottom: 30px;
            text-align: center;
        }

        .form-group label {
            font-size: 20px;
            margin-top: 50px; /* Adjusted margin */
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="tel"],
        .form-group select {
            margin-top: 5px; /* Adjusted margin */
            width: 100%;
            box-sizing: border-box;
        }

        #title,
        #title2 {
            font-size: 24px;
            text-decoration: underline;
            margin-bottom: 10px;
        }

        img {
            display: block;
            margin-left: auto;
            margin-right: auto;
            width: 10%;
            margin-top: 10px;
        }

        .form-check-inline {
            display: inline-block;
            margin-right: 15px;
            margin-bottom: 10px;
        }

        .form-check-input,
        .form-check-label {
            font-size: 20px;
        }

        .form-check-input,
        .form-check-label {
            font-size: 18px;
        }

        .hidden-box {
            display: none;
        }

        #underHeader {
            font-size: 20px;
            text-align: center;
            margin-bottom: 10px;
            font-family: 'Times New Roman', Times, serif;
        }

        .form-group label {
            font-size: 20px;
            margin-top: 30px;
        }

        .buttons.first-button {
            display: flex;
            justify-content: center;
            margin-top: 15px;
            margin-bottom: 20px; /* Adjusted margin */
        }

        .buttons.first-button button {
            width: 10%;
            padding: 10px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 15px;
            position: relative;
            margin-right: 30px;
            font-size: 15px;
        }

        .buttons.first-button button[name="cancel"] {
            background-color: #ff3333;
        }     
  </style>

</head>
    <%
        Form form = (Form) request.getSession().getAttribute("form");
            
        form = FormDao.findFormByID(form.getCustomerID());
    %>

<body>
    <img src="../images/JATA NEGARA.jpg">
    <div id="underHeader" class="underHeader" style="text-align: center;">JABATAN TENAGA MANUSIA</div>
    <header class="text-center">BORANG ADUAN PELANGGAN</header>
    <span id="title" class="title">Butiran Pelanggan</span>
    <form
        <div class="flex-container">
            <div class="form-group">
                <label for="customerName" class="fixed-width-label">Nama</label>
                <input type="text" class="form-control" id="customerName" placeholder="Nama penuh" size="65">
            </div>
            <div class="form-group">
                <label for="customerID" class="fixed-width-label">No. Pendaftaran/KP</label>
                <input type="text" class="form-control" id="customerID" placeholder="Cth:000712-01-5781" size="25" padding="20px">
            </div>
            <div class="form-group">
                <label for="customerEmail" class="fixed-width-label">Alamat E-mel</label>
                <input type="email" class="form-control" id="customerEmail" placeholder="Cth:aiman@gmail.com" size="20">
            </div>
            <div class="form-group">
                <label for="customerPhoneNumber" class="fixed-width-label">No. Telefon</label>
                <input type="text" class="form-control" id="customerPhoneNumber" placeholder="Cth:012-9862351" size="20">
            </div>
        </div>

        <div class="flex-container">
          <div class="form-group">
              <label for="buildingNo" class="fixed-width-label">Alamat</label>
              <input type="text" class="form-control" id="buildingNo" placeholder="Cth:No 12, Lorong 2, Taman Perdana" size="65">
          </div>
          <div class="form-group">
              <label for="zipCode" class="fixed-width-label">Poskod</label>
              <input type="text" class="form-control" id="zipCode" placeholder="Cth:27000" size="20" padding="5px">
          </div>
          <div class="form-group">
              <label for="city" class="fixed-width-label" >Negeri</label>
              <select id="city" class="form-control">
                    <option value="Perak" <% if (form.getState().equals("Perak")) { %>selected<% } %>>Perak</option>
                    <option value="Kedah" <% if (form.getState().equals("Kedah")) { %>selected<% } %>>Kedah</option>
                    <option value="Penang"<% if (form.getState().equals("Penang")) { %>selected<% } %>>Penang</option>
                    <option value="Kelantan" <% if (form.getState().equals("Kelantan")) { %>selected<% } %>>Kelantan</option>
                    <option value="Terengganu" <% if (form.getState().equals("Terengganu")) { %>selected<% } %>>Terengganu</option>
                    <option value="Pahang" <% if (form.getState().equals("Pahang")) { %>selected<% } %>>Pahang</option>
                    <option value="Perlis" <% if (form.getState().equals("Perlis")) { %>selected<% } %>>Perlis</option>
                    <option value="Selangor" <% if (form.getState().equals("Selangor")) { %>selected<% } %>>Selangor</option>
                    <option value="Kuala Lumpur" <% if (form.getState().equals("Kuala Lumpur")) { %>selected<% } %>>Kuala Lumpur</option>
                    <option value="Putrajaya"<% if (form.getState().equals("Putrajaya")) { %>selected<% } %>>Putrajaya</option>
                    <option value="Negeri Sembilan" <% if (form.getState().equals("Negeri Sembilan")) { %>selected<% } %>>Negeri Sembilan</option>
                    <option value="Malacca" <% if (form.getState().equals("Malacca")) { %>selected<% } %>>Malacca</option>
                    <option value="Johor" <% if (form.getState().equals("Johor")) { %>selected<% } %>>Johor</option>
                    <option value="Labuan" <% if (form.getState().equals("labuan")) { %>selected<% } %>>Labuan</option>
                    <option value="Sabah" <% if (form.getState().equals("Sabah")) { %>selected<% } %>>Sabah</option>
                    <option value="Sarawak" <% if (form.getState().equals("Sarawak")) { %>selected<% } %>>Sarawak</option>
              </select>
          </div>
          <div class="form-group">
              <label for="state" class="fixed-width-label" size="20" height="20">Daerah</label>
              <select id="state" required value="<%=form.getCity()%>" class="form-control">
                <option disabled selected>Pilih negeri anda</option> 
                <% 
                    String selectedCity = form.getCity();
                    if (selectedCity != null) { %>
                    <option value="<%= selectedCity %>" selected><%= selectedCity %></option>
                    <% } %>
              </select>
          </div>
      </div>
      
      <span id="title2" class="title2" style="margin-top: 20px;">Maklumat Aduan</span>
      <div class="form-group">
        <label for="detailsComplaint">Butiran Aduan</label>
        <div>
            <textarea class="form-control" id="detailsComplaint" placeholder="Cth:"></textarea>
        </div>
        
    </div>


    <div class="form-group">
        <label for="zipCode">Sumber Aduan</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="sourceComplaintRadio" id="sourceComplaintPelajar" value="Pelajar">
        <label class="form-check-label" for="sourceComplaintPelajar">Dalaman - pelajar</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="sourceComplaintRadio" id="sourceComplaintKakitangan" value="Staff">
        <label class="form-check-label" for="sourceComplaintKakitangan">Dalaman - kakitangan / pekerja kontrak</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="sourceComplaintRadio" id="sourceComplaintLuar" value="Pekerja">
        <label class="form-check-label" for="sourceComplaintLuar">Luar - pekerja / pelawat / kontraktor</label>
    </div>
    <div class="form-check form-check-inline">
        <input class="form-check-input" type="radio" name="sourceComplaintRadio" id="sourceComplaintlain" value="Lain-Lain">
        <label class="form-check-label" for="sourceComplaintlain">Lain-Lain</label>
    </div>
    

    <!-- Additional box that will be shown when "Lain-Lain" is selected -->
    <div id="hiddenBox" class="form-group hidden-box">
        <label for="additionalDetails">Maklumat Tambahan</label>
        <input type="text" class="form-control" id="additionalDetails" placeholder="Cth:">
    </div>

    <div class="buttons first-button">
         <button type="submit" class="btn btn-primary">Submit</button>
    </div>
     
        <script>
            // Function to populate city options based on the selected state
            function populateCityOptions() {
              var stateSelect = document.getElementById("state");
              var citySelect = document.getElementById("city");
              var stateValue = stateSelect.value;

              // Clear existing city options
              citySelect.innerHTML = '<option disabled selected>Choose your city</option>';

              // Populate city options based on the selected state
              switch (stateValue) {
                case "Perak": // Perak
                  citySelect.innerHTML += `
                    <option value="Ipoh">Ipoh</option>
                    <option value="Batu Gajah">Batu Gajah</option>
                    <option value="Kampar">Kampar</option>
                    <option value="Seri Manjung">Seri Manjung</option>
                    <option value="Lumut">Lumut</option>
                    <option value="Kuala Kangsar">Kuala Kangsar</option>
                    <option value="Gerik">Gerik</option>
                    <option value="Lenggong">Lenggong</option>
                    <option value="Taiping">Taiping</option>
                    <option value="Parit Buntar">Parit Buntar</option>
                    <option value="Tapah">Tapah</option>
                    <option value="Tanjung Malim">Tanjung Malim</option>
                    <option value="Teluk Intan">Teluk Intan</option>
                    <option value="Sungai Siput">Sungai Siput</option>
                    <option value="Tanjung Rambutan">Tanjung Rambutan</option>
                    <option value="Chemor">Chemor</option>
                    <option value="Gopeng">Gopeng</option>
                    <option value="Malim Mawar">Malim Mawar</option>
                    <option value="Tanjung Tualang">Tanjung Tualang</option>
                    <option value="Bota">Bota</option>
                    <option value="Beruas">Beruas</option>
                    <option value="Bagan Serai">Bagan Serai</option>
                    <option value="Slim River">Slim River</option>
                  `;
                  break;

                case "Kedah": // Kedah
                  citySelect.innerHTML += `
                    <option value="Alor Setar">Alor Setar</option>
                    <option value="Jitra">Jitra</option>
                    <option value="Langgar">Langgar</option>
                    <option value="Pendang">Pendang</option>
                    <option value="Kuah">Kuah</option>
                    <option value="Sungai Petani">Sungai Petani</option>
                    <option value="Gurun">Gurun</option>
                    <option value="Merbok">Merbok</option>
                    <option value="Kampung Merbok">Kampung Merbok</option>
                    <option value="Kota Kuala Muda">Kota Kuala Muda</option>
                    <option value="Kulim">Kulim</option>
                    <option value="Kuala Ketil">Kuala Ketil</option>
                    <option value="Changlun">Changlun</option>
                    <option value="Kodiang">Kodiang</option>
                    <option value="Bukit Kayu Hitam">Bukit Kayu Hitam</option>
                    <option value="Kuala Nerang">Kuala Nerang</option>
                    <option value="Kota Sarang Semut">Kota Sarang Semut</option>
                    <option value="Bedong">Bedong</option>
                    <option value="Lunas">Lunas</option>
                    <option value="Padang Serai">Padang Serai</option>
                  `;
                  break;

                case "Penang": // Penang
                  citySelect.innerHTML += `
                    <option value="Georgetown">Georgetown</option>
                    <option value="Balik Pulau">Balik Pulau</option>
                    <option value="Bayan Lepas">Bayan Lepas</option>
                    <option value="Butterworth">Butterworth</option>
                    <option value="Kepala Batas">Kepala Batas</option>
                    <option value="Bukit Mertajam">Bukit Mertajam</option>
                    <option value="Sungai Bakap">Sungai Bakap</option>
                    <option value="Nibong Tebal">Nibong Tebal</option>
                    <option value="Teluk Bahang">Teluk Bahang</option>
                    <option value="Batu Ferringhi">Batu Ferringhi</option>
                    <option value="Air Itam">Air Itam</option>
                    <option value="Batu Maung">Batu Maung</option>
                    <option value="Tasek Gelugor">Tasek Gelugor</option>
                    <option value="Perai">Perai</option>
                    <option value="Jawi">Jawi</option>
                  `;
                  break;

                case "Kelantan": // Kelantan
                  citySelect.innerHTML += `
                    <option value="Kota Bharu">Kota Bharu</option>
                    <option value="Bachok">Bachok</option>
                    <option value="Pasir Mas">Pasir Mas</option>
                    <option value="Tanah Merah">Tanah Merah</option>
                    <option value="Kuala Krai">Kuala Krai</option>
                    <option value="Tumpat">Tumpat</option>
                    <option value="Wakaf Bharu">Wakaf Bharu</option>
                    <option value="Dabong">Dabong</option>
                    <option value="Gua Musang">Gua Musang</option>
                  `;
                  break;

                case "Terengganu": // Terengganu
                  citySelect.innerHTML += `
                    <option value="Kuala Terengganu">Kuala Terengganu</option>
                    <option value="Ajil">Ajil</option>
                    <option value="Bandar Permaisuri">Bandar Permaisuri</option>
                    <option value="Kuala Besut">Kuala Besut</option>
                    <option value="Kuala Dungun">Kuala Dungun</option>
                    <option value="Chukai">Chukai</option>
                    <option value="Kijal">Kijal</option>
                    <option value="Kemasik">Kemasik</option>
                    <option value="Marang">Marang</option>
                    <option value="Paka">Paka</option>
                    <option value="Jerteh">Jerteh</option>
                    <option value="Setiu">Setiu</option>
                    <option value="Kerteh">Kerteh</option>
                  `;
                  break;

                case "Pahang": // Pahang
                  citySelect.innerHTML += `
                    <option value="Kuantan">Kuantan</option>
                    <option value="Temerloh">Temerloh</option>
                    <option value="Bentong">Bentong</option>
                    <option value="Jerantut">Jerantut</option>
                    <option value="Gambang">Gambang</option>
                    <option value="Bera">Bera</option>
                    <option value="Lipis">Lipis</option>
                    <option value="Pekan">Pekan</option>
                    <option value="Cameron Highlands">Cameron Highlands</option>
                    <option value="Raub">Raub</option>
                    <option value="Kuala Rompin">Kuala Rompin</option>
                    <option value="Mentakab">Mentakab</option>
                    <option value="Karak">Karak</option>
                    <option value="Triang">Triang</option>
                  `;
                  break;

                case "Perlis": // Perlis
                  citySelect.innerHTML += `
                    <option value="Kangar">Kangar</option>
                    <option value="Arau">Arau</option>
                    <option value="Simpang Empat">Simpang Empat</option>
                    <option value="Kuala Perlis">Kuala Perlis</option>
                    <option value="Padang Besar">Padang Besar</option> 
                  `;
                  break;

                case "Selangor": // Selangor
                  citySelect.innerHTML += `
                    <option value="Shah Alam">Shah Alam</option>
                    <option value="Klang">Klang</option>
                    <option value="Kajang">Kajang</option>
                    <option value="Kuala Kubu Bharu">Kuala Kubu Bharu</option>
                    <option value="Sabak Bernam">Sabak Bernam</option>
                    <option value="Bestari Jaya">Bestari Jaya</option>
                    <option value="Petaling Jaya">Petaling Jaya</option>
                    <option value="Subang Jaya">Subang Jaya</option>
                    <option value="Rawang">Rawang</option>
                    <option value="Cyberjaya">Cyberjaya</option>
                    <option value="Sungai Besar">Sungai Besar</option>
                    <option value="Banting">Banting</option>
                    <option value="Seri Kembangan">Seri Kembangan</option>
                    <option value="Bangi">Bangi</option>
                    <option value="Dengkil">Dengkil</option>
                    <option value="Beranang">Beranang</option>
                    <option value="Semenyih">Semenyih</option>
                    <option value="Sepang">Sepang</option>         
                    <option value="Batang Kali">Batang Kali</option>
                    <option value="Cheras">Cheras</option>
                    <option value="Putrajaya">Putrajaya</option>
                  `;
                  break;

                case "Kuala Lumpur": // Kuala Lumpur
                  citySelect.innerHTML += `
                    <option value="Kuala Lumpur">Kuala Lumpur</option>         
                  `;
                  break;                

                 case "Negeri Sembilan": // Negeri Sembilan
                  citySelect.innerHTML += `
                    <option value="Seremban">Seremban</option>
                    <option value="Port Dickson">Port Dickson</option>
                    <option value="Tanjung Ipoh">Tanjung Ipoh</option>
                    <option value="Kuala Klawang">Kuala Klawang</option>
                    <option value="Kampong Lenggeng">Kampong Lenggeng</option>
                    <option value="Kampong Baharu Nilai">Kampong Baharu Nilai</option>
                    <option value="Labu">Labu</option>
                    <option value="Bahau">Bahau</option>
                    <option value="Batu Kikir">Batu Kikir</option>
                    <option value="Simpang Pertang">Simpang Pertang</option>
                    <option value="Tampin">Tampin</option>
                    <option value="Gemas">Gemas</option>
                    <option value="Rompin">Rompin</option>
                    <option value="Linggi">Linggi</option>
                    <option value="Rantau">Rantau</option>
                    <option value="Rembau">Rembau</option>
                    <option value="Kuala Pilah">Kuala Pilah</option>
                    <option value="Johol">Johol</option>         
                    <option value="Rompin">Rompin</option>
                  `;
                  break;

                  case "Malacca": // Malacca
                  citySelect.innerHTML += `
                    <option value="Jasin">Jasin</option>
                    <option value="Ayer Keroh">Ayer Keroh</option>
                    <option value="Durian Tunggal">Durian Tunggal</option>
                    <option value="Sungai Udang">Sungai Udang</option>
                    <option value="Selandar">Selandar</option>
                    <option value="Merlimau">Merlimau</option>
                    <option value="Alor Gajah">Alor Gajah</option>
                    <option value="Masjid Tanah">Masjid Tanah</option>        
                  `;
                  break;

                  case "Johor": // Johor
                  citySelect.innerHTML += `
                    <option value="Skudai">Skudai</option>
                    <option value="Johor Bahru">Johor Bahru</option>
                    <option value="Kulai">Kulai</option>
                    <option value="Ulu Tiram">Ulu Tiram</option>
                    <option value="Batu Pahat">Batu Pahat</option>
                    <option value="Muar">Muar</option>
                    <option value="Bukit Gambir">Bukit Gambir</option>
                    <option value="Segamat">Segamat</option>
                    <option value="Mersing">Mersing</option>
                    <option value="Endau">Endau</option>
                    <option value="Gelang Patah">Gelang Patah</option>
                    <option value="Senai">Senai</option>
                    <option value="Bandar Tenggara">Bandar Tenggara</option>
                    <option value="Pangerang">Pangerang</option>
                    <option value="Pasir Gudang">Pasir Gudang</option>
                    <option value="Kota Tinggi">Kota Tinggi</option>
                    <option value="Kampung Sedili Besar">Kampung Sedili Besar</option>
                    <option value="Pontian">Pontian</option>         
                    <option value="Tampoi">Tampoi</option>
                    <option value="Yong Peng">Yong Peng</option>
                    <option value="Tangkak">Tangkak</option>
                    <option value="Pagoh">Pagoh</option>
                    <option value="Labis">Labis</option>
                  `;
                  break;

                  case "Labuan": // Labuan
                  citySelect.innerHTML += `
                    <option value="Victoria">Victoria</option>       
                  `;
                  break;

                  case "Sabah": // Sabah
                  citySelect.innerHTML += `
                    <option value="Bandar Labuan">Bandar Labuan</option>
                    <option value="Kota Kinabalu">Kota Kinabalu</option>
                    <option value="Keningau">Keningau</option>
                    <option value="Kudat">Kudat</option>
                    <option value="Kota Belud">Kota Belud</option>
                    <option value="Tuaran">Tuaran</option>
                    <option value="Tamparuli">Tamparuli</option>
                    <option value="Ranau">Ranau</option>
                    <option value="Penampang">Penampang</option>
                    <option value="Papar">Papar</option>
                    <option value="Tambunan">Tambunan</option>
                    <option value="Bongawan">Bongawan</option>
                    <option value="Membakut">Membakut</option>
                    <option value="Kuala Penyu">Kuala Penyu</option>
                    <option value="Beaufort">Beaufort</option>
                    <option value="Sipitang">Sipitang</option>
                    <option value="Tenom">Tenom</option>
                    <option value="Beluran">Beluran</option>         
                    <option value="Sandakan">Sandakan</option>
                    <option value="Tawau">Tawau</option>
                    <option value="Kunak">Kunak</option>
                    <option value="Semporna">Semporna</option>
                    <option value="Lahad Datu">Lahad Datu</option>
                  `;
                  break;

                  case "Sarawak": // Sarawak
                  citySelect.innerHTML += `
                    <option value="Kuching">Kuching</option>
                    <option value="Bau">Bau</option>
                    <option value="Lundu">Lundu</option>
                    <option value="Serian Division">Serian Division</option>
                    <option value="Simunjan">Simunjan</option>
                    <option value="Sri Aman">Sri Aman</option>
                    <option value="Saratok">Saratok</option>
                    <option value="Betong">Betong</option>
                    <option value="Sibu">Sibu</option>
                    <option value="Sarikei">Sarikei</option>
                    <option value="Dalat">Dalat</option>
                    <option value="Bintulu">Bintulu</option>
                    <option value="Miri">Miri</option>
                    <option value="Bekenu">Bekenu</option>
                    <option value="Lawas">Lawas</option>
                    <option value="Mukah">Mukah</option>
                    <option value="Kanowit">Kanowit</option>
                  `;
                  break;

                default:
                  break;
              }
            }

            // Add an event listener to the state select element
            var stateSelect = document.getElementById("state");
            stateSelect.addEventListener("change", populateCityOptions);
          </script>   
        <!--<script src="../Client/EditProfile.js"></script>-->
    </body> 
</html>

