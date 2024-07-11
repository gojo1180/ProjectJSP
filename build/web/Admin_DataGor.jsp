<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="HeaderAdmin.jsp" %>
<%@page import="Model.Gor" %>
<%@page import="java.util.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Page</title>
    <link rel="stylesheet" href="CSS/AdminStyle.css">
</head>
<body>
    <div class="main-content">
        <div class="content-title">
            <h1>Data GOR</h1>
            <button class="btn-addgor" onclick="openAddModal()">Add GOR</button>
        </div>
        <table border="1">
            <tr>
                <th>Gambar</th>
                <th>Nama GOR</th>
                <th>Kota</th>
                <th>Rating</th>
                <th>Harga</th>
                <th>Lokasi</th>
                <th>Link Lokasi</th>
                <th>Deskripsi</th>
                <th>Actions</th>
            </tr>
            <%
                ArrayList<Gor> gorList = (ArrayList<Gor>) request.getAttribute("gorList");
                
                if (gorList != null) {
                    for (Gor gor : gorList) {
                    String desktrim = gor.getDeskripsi().replaceAll("\n","");
            %>
            <tr>
                <td>
                    <%
                        String base64Image = gor.getImageBase64();
                        if (base64Image != null) {
                    %>
                    <img class="image-gor" src="data:image/jpeg;base64,<%= base64Image %>" alt="Gambar GOR" width="250" height="auto">
                    <%
                        } else {
                    %>
                    <img src="default-image.jpg" alt="Gambar GOR" width="400">
                    <%
                        }
                    %>
                </td>
                <td class="isi-td"><%= gor.getNama_Gor() %></td>
                <td class="isi-td"><%= gor.getKota() %></td>
                <td class="isi-td"><%= gor.getRating() %></td>
                <td class="isi-td"><%= gor.getHarga() %></td>
                <td class="isi-td"><%= gor.getLocation()%></td>
                <td class="isi-td">
                    <a href ="<%= gor.getLocationLink()%>">Link</a>
                </td>
                <td class="konten-td">
                    <%= gor.getDeskripsi().replace("\n","<br>")%>
                </td>
                <%!  %>
                <td class="actions-btn">
                        <button class="btn-more" id="update" onclick="openUpdateModal(<%= gor.getId_Gor() %>, '<%= gor.getNama_Gor() %>', '<%= gor.getKota() %>', <%= gor.getRating() %>, <%= gor.getHarga() %>, '<%= gor.getLocation()%>', '<%= gor.getLocationLink()%>',  '<%=desktrim%>', '<%= base64Image %>')">Update</button>
                    <button class="btn-more" id="delete" onclick="openDeleteModal(<%= gor.getId_Gor() %>)">Delete</button>
                </td>
            </tr>
            <% 
                    }
                } 
            %>
        </table>
    </div>

    <!-- Add GOR Modal -->
    <div id="addModalGor" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeAddModal()">&times;</span>
            <h2>Add GOR</h2>
            <form action="GorDataServlet" method="post">
                <input type="hidden" name="action" value="add">
                <label for="namaGor">Nama GOR:</label><br>
                <input type="text" id="namaGor" name="namaGor" required><br>
                <label for="kota">Kota:</label><br>
                <input type="text" id="kota" name="kota" required><br>
                <label for="rating">Rating:</label><br>
                <input type="number" step="0.1" id="rating" name="rating" required><br>
                <label for="harga">Harga:</label><br>
                <input type="number" step="0.01" id="harga" name="harga" required><br>
                <label for="location">Lokasi:</label><br>
                <input type="text" id="location" name="location" required><br>
                <label for="locationLink">Link Lokasi:</label><br>
                <input type="text" id="locationLink" name="locationLink" required><br>
                <label for="Deskripsi">Deskripsi:</label><br>
                <textarea rows="3" cols="16" id="Deskripsi" name="Deskripsi" required></textarea><br>
                <label for="image">Image:</label><br>
                <input type="file" id="image" name="image" accept="image/*" required><br>
                <input type="hidden" id="imageBase64" name="imageBase64"><br>
                <button type="submit">Add GOR</button>
            </form>
        </div>
    </div>

    <!-- Update GOR Modal -->
    <div id="updateModalGor" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeUpdateModal()">&times;</span>
            <h2>Update GOR</h2>
            <form id="updateForm" action="UpdateGorServlet" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" id="updateId" name="id">
                <label for="updateNamaGor">Nama GOR:</label><br>
                <input type="text" id="updateNamaGor" name="namaGor" ><br>
                <label for="updateKota">Kota:</label><br>
                <input type="text" id="updateKota" name="kota" ><br>
                <label for="updateRating">Rating:</label><br>
                <input type="number" step="0.1" id="updateRating" name="rating" ><br>
                <label for="updateHarga">Harga:</label><br>
                <input type="number" step="0.01" id="updateHarga" name="harga" ><br>
                <label for="updateLocation">Lokasi:</label><br>
                <input type="text" id="updateLocation" name="location" ><br>
                <label for="updateLocationLink">Lokasi Link:</label><br>
                <input type="text" id="updateLocationLink" name="locationLink" ><br>
                <label for="updateDeskripsi">Deskripsi:</label><br>
                <textarea rows="3" cols="16" id="updateDeskripsi" name="Deskripsi" ></textarea><br>
                <label for="updateImage">Image:</label><br>                                                             
                <input type="file" id="updateImage" name="image" accept="image/*"><br>
                <input type="hidden" id="updateImageBase64" name="imageBase64"><br>
                <button type="submit">Update GOR</button>
            </form>
        </div>
    </div>
    
    <div id="deleteModalGor" class="modal">
        <div class="modal-confirmation">
            <span class="close" onclick="closeDeleteModal()">&times;</span>
            <h2>Confirm Delete</h2>
            <p>Are you sure you want to delete this Gor?</p>
            <div class="button-container">
                <button id="confirmDelete" class="btn-delete">Delete</button>
                <button onclick="closeDeleteModal()" class="btn-cancel">Cancel</button>
            </div>
        </div>
    </div>

    <script>
        // Get the modals
        var addModal = document.getElementById('addModalGor');
        var updateModal = document.getElementById('updateModalGor');
        var deleteModal = document.getElementById('deleteModalGor');
        var deleteButton = document.getElementById('confirmDelete');

        // Open the add modal
        function openAddModal() {
            addModal.style.display = "block";
        }

        // Close the add modal
        function closeAddModal() {
            addModal.style.display = "none";
        }
        
        // Open the delete modal with the id of the GOR to be deleted
        function openDeleteModal(id) {
            deleteModal.style.display = "block";
            deleteButton.onclick = function() {
                location.href = 'DeleteGorServlet?id=' + id;
            };
        }

        // Close the delete modal
        function closeDeleteModal() {
            deleteModal.style.display = "none";
        }

        // Open the update modal with pre-filled data
        function openUpdateModal(id, namaGor, kota, rating, harga, location, locationLink, Deskripsi, image) {
            document.getElementById('updateId').value = id;
            document.getElementById('updateNamaGor').value = namaGor;
            document.getElementById('updateKota').value = kota;
            document.getElementById('updateRating').value = rating;
            document.getElementById('updateHarga').value = harga;
            document.getElementById('updateLocation').value = location;
            document.getElementById('updateLocationLink').value = locationLink;
            document.getElementById('updateDeskripsi').value = Deskripsi.replaceAll("<br>","\n");
            document.getElementById('updateImageBase64').value = image;

            updateModal.style.display = "block";
        }

        // Close the update modal
        function closeUpdateModal() {
            updateModal.style.display = "none";
        }

        // Convert image file to base64
        function toBase64(file, callback) {
            const reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onload = () => callback(reader.result.split(',')[1]);
            reader.onerror = error => console.error('Error: ', error);
        }

        // Handle image input change for add modal
        document.getElementById('image').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                toBase64(file, function(base64) {
                    document.getElementById('imageBase64').value = base64;
                });
            }
        });

        // Handle image input change for update modal
        document.getElementById('updateImage').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                toBase64(file, function(base64) {
                    document.getElementById('updateImageBase64').value = base64;
                });
            }
        });

        // Close the modals when clicking outside of them
        window.onclick = function(event) {
            if (event.target === addModal) {
                closeAddModal();
            }
            if (event.target === updateModal) {
                closeUpdateModal();
            }
            if (event.target === deleteModal) {
                closeDeleteModal();
            }
        }
    </script>
</body>
</html>
<%@include file="Footer.jsp" %>