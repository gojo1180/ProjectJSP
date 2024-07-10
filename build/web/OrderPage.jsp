<%@page import="Controller.userDAO"%>
<%@page import="Model.Gor"%>
<%@page import="Model.User"%>
<%@page import="java.util.Base64"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@include file="Header.jsp" %>

<%
    Gor selectedGor = (Gor) request.getAttribute("selectedGor");
    String base64Image = selectedGor != null ? selectedGor.getImageBase64() : null;

    String username = null;
    String email = null;
    boolean isLoggedIn = false;

    if (session != null && session.getAttribute("user") != null) {
        username = (String) session.getAttribute("user");
        userDAO UserDAO = new userDAO();
        User user = UserDAO.getUserByUsername(username);
        email = (user != null) ? user.getEmail() : "";
        isLoggedIn = true;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= selectedGor != null ? selectedGor.getNama_Gor() : "GOR Details" %></title>
        <link rel="stylesheet" type="text/css" href="CSS/Gor.css">
        <style>
            /* Modal styles */
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgba(0,0,0,0.4);
                padding-top: 60px;
            }
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 80%;
                max-width: 500px;
                border-radius: 10px;
            }
            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }
            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
            .modal-header, .modal-body, .modal-footer {
                padding: 10px;
            }
            .modal-header {
                border-bottom: 1px solid #ddd;
            }
            .modal-footer {
                border-top: 1px solid #ddd;
                text-align: right;
            }
            .modal-body form {
                display: flex;
                flex-direction: column;
            }
            .modal-body form div {
                margin-bottom: 15px;
            }
            .modal-body label {
                margin-bottom: 5px;
                font-weight: bold;
            }
            .modal-body input[type="text"],
            .modal-body input[type="email"],
            .modal-body input[type="date"],
            .modal-body input[type="time"],
            .modal-body input[type="number"],
            .modal-body select,
            .modal-body button {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            .modal-body button {
                background-color: var(--main-color);
                color: white;
                border: none;
                cursor: pointer;
                font-size: 16px;
            }
            .modal-body button:hover {
                background-color: var(--main-color-hover);
            }
            .modal-body select option.booked {
                background-color: red;
                color: white;
            }
        </style>
    </head>
    <body>
        <div class="content">
            <div class="main-content">
                <div class="court-pic-title">
                    <% if (base64Image != null) { %>
                        <img src="data:image/jpeg;base64,<%= base64Image %>" alt="<%= selectedGor.getNama_Gor() %>">
                    <% } else { %>
                        <img src="default-image.jpg" alt="<%= selectedGor != null ? selectedGor.getNama_Gor() : "Default Image" %>">
                    <% } %>
                </div>

                <div class="h-line"></div>

                <article>
                    <div class="deskripsi">
                        <span style="font-size: 17px; font-weight: 800; color: var(--main-color);"><i class="ri-arrow-right-s-fill" style="color: var(--text-color);"></i>Deskripsi</span>
                    </div>
                    <p>
                        <%= selectedGor.getDeskripsi()%>
                    </p>
                </article>
            </div>

            <div class="h-line"></div>

            <div class="side-bar">
                <div class="side-content">
                    <% if (selectedGor != null) { %>
                    <div class="gor-desc">
                        <p id="gor-name"><%= selectedGor.getNama_Gor() %></p>
                        <span id="rating"><i class="ri-star-fill"></i> <%= selectedGor.getRating() %></span>
                    </div>

                    <div class="h-line-side"></div>

                    <div class="locfaci">
                        <p class="judul">Location</p>
                        <a href="<%= selectedGor.getLocationLink() %>" target="_blank">
                            <div class="maps">
                                <div class="text">
                                    <p><%= selectedGor.getLocation() %></p>
                                </div>
                                <div class="pic">
                                    <i class="ri-map-pin-2-fill"></i>
                                </div>
                            </div>
                        </a>

                        <p class="judul">Facilities</p>
                        <div class="facilities">
                            <div class="facil-list">
                                <div class="facil-icon"><i class="ri-car-fill"></i></div>
                                <div class="facil-text">Parkir <br>Mobil</div>
                            </div>
                            <div class="facil-list">
                                <div class="facil-icon"><i class="ri-motorbike-fill"></i></div>
                                <div class="facil-text">Parkir Motor</div>
                            </div>
                            <div class="facil-list">
                                <div class="facil-icon"><i class="ri-cup-fill"></i></div>
                                <div class="facil-text">Jual Minuman</div>
                            </div>
                            <div class="facil-list">
                                <div class="facil-icon"><i class="ri-bowl-fill"></i></div>
                                <div class="facil-text">Jual Makanan</div>
                            </div>
                        </div>
                    </div>
                    <div class="h-line-side"></div>
                    <div class="order">
                        <div class="judul">Mulai Dari</div>
                        <div class="subjudul">Rp <%= selectedGor.getHarga() %>/sesi</div>
                        <div class="buttonPesan requires-login">
                            <div class="keterangan">Pesan Sekarang</div>
                        </div>
                    </div>  
                    <% } else { %>
                    <div class="gor-desc">
                        <p id="gor-name">GOR Not Available</p>
                    </div>
                    <% } %>
                </div>
            </div>
        </div>

        <!-- Booking Modal -->
        <div id="bookingModal" class="modal">
            <div class="modal-content">
                <div class="modal-header">
                    <span class="close">&times;</span>
                    <h2>Booking Lapangan</h2>
                </div>
                <div class="modal-body">
                    <form id="bookingForm" action="BookingServlet" method="post">
                        <div>
                            <label for="name">Nama:</label>
                            <input type="text" id="name" name="name" value="<%= username %>" required>
                        </div>
                        <div>
                            <label for="email">Email:</label>
                            <input type="email" id="email" name="email" value="<%= email %>" required>
                        </div>
                        <div>
                            <label for="court">Pilih Lapangan:</label>
                            <select id="court" name="court" required>
                                <option value="Lapangan 1">Lapangan 1</option>
                                <option value="Lapangan 2">Lapangan 2</option>
                                <option value="Lapangan 3">Lapangan 3</option>
                            </select>
                        </div>
                        <div>
                            <label for="date">Tanggal:</label>
                            <input type="date" id="date" name="date" required>
                        </div>
                        <div>
                            <label for="time">Pilih Waktu:</label>
                            <select id="time" name="time" onclick="" required>
                                <option value="6:00-7:00">6:00 - 7:00</option>
                                <option value="7:00-8:00">7:00 - 8:00</option>
                                <option value="8:00-9:00">8:00 - 9:00</option>
                                <option value="9:00-10:00">9:00 - 10:00</option>
                                <option value="10:00-11:00">10:00 - 11:00</option>
                                <option value="11:00-12:00">11:00 - 12:00</option>
                                <option value="12:00-13:00">12:00 - 13:00</option>
                                <option value="13:00-14:00">13:00 - 14:00</option>
                                <option value="14:00-15:00">14:00 - 15:00</option>
                                <option value="15:00-16:00">15:00 - 16:00</option>
                                <option value="16:00-17:00">16:00 - 17:00</option>
                                <option value="17:00-18:00">18:00 - 19:00</option>
                                <option value="18:00-19:00">19:00 - 20:00</option>
                                <option value="19:00-20:00">20:00 - 21:00</option>
                                <option value="20:00-21:00">21:00 - 22:00</option>
                            </select>
                        </div>
                        <div>
                            <label for="price">Harga:</label>
                            <input type="number" id="price" name="price" value="<%= selectedGor != null ? selectedGor.getHarga() : 0 %>" readonly="">
                        </div>  
                        <div>
                            <input type="hidden" name="gor_nama" value="<%= selectedGor != null ? selectedGor.getNama_Gor() : "" %>" >
                            <button type="submit">Book Now</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <h3>Thank you for booking with us!</h3>
                </div>
            </div>
        </div>

        <script>
            // Get the modal
            var modal = document.getElementById("bookingModal");

            // Get the button that opens the modal
            var btn = document.querySelector(".buttonPesan.requires-login");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];

            // When the user clicks the button, open the modal if logged in, else alert
            btn.onclick = function() {
                if (<%= isLoggedIn %>) {
                    modal.style.display = "block";
                } else {
                    alert("Please log in to book a court.");
                }
            }

            // When the user clicks on <span> (x), close the modal
            span.onclick = function() {
                modal.style.display = "none";
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                }
            }

            // Fetch booked time slots when the date is selected
            document.getElementById('date').addEventListener('change', function() {
                var selectedDate = this.value;
                var gorName = '<%= selectedGor != null ? selectedGor.getNama_Gor() : "" %>';
                fetchBookedTimeSlots(gorName, selectedDate);
            });

            function fetchBookedTimeSlots(gorName, date) {
                fetch('BookedTimeSlotsServlet?gorName=' + encodeURIComponent(gorName) + '&date=' + encodeURIComponent(date))
                    .then(response => response.json())
                    .then(bookedTimeSlots => {
                        var timeSelect = document.getElementById('time');
                        var options = timeSelect.options;

                        // Reset all options
                        for (var i = 0; i < options.length; i++) {
                            options[i].disabled = false;
                            options[i].classList.remove('booked');
                        }

                        // Disable booked time slots
                        bookedTimeSlots.forEach(timeSlot => {
                            for (var i = 0; i < options.length; i++) {
                                if (options[i].value === timeSlot) {
                                    options[i].disabled = true;
                                    options[i].classList.add('booked');
                                }
                            }
                        });
                    });
            }
        </script>
    </body>
</html>

<%@include file="Footer.jsp" %>

