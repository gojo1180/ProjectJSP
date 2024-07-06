<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="HeaderAdmin.jsp" %>
<%@page import="Model.Gor" %>
<%@page import="java.util.*" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Admin Page</title>
    <link rel="stylesheet" href="CSS/Admin.css">
    <link rel="stylesheet" href="CSS/Modal.css">
    <script src="JS/Modal.js"></script>
</head>
<body>
    <div class="container">
        <h1>Data GOR</h1>
        <table border="1">
            <tr>
                <th>Gambar</th>
                <th>Nama GOR</th>
                <th>Kota</th>
                <th>Rating</th>
                <th>Harga</th>
                <th>Actions</th>
            </tr>
            <%
                ArrayList<Gor> gorList = (ArrayList<Gor>) request.getAttribute("gorList");
                if (gorList != null) {
                    for (Gor gor : gorList) {
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
                <td><%= gor.getNama_Gor() %></td>
                <td><%= gor.getKota() %></td>
                <td><%= gor.getRating() %></td>
                <td><%= gor.getHarga() %></td>
                <td>
                    <button class="btn-more" id="update" onclick="openUpdateModal(<%= gor.getId_Gor() %>, '<%= gor.getNama_Gor() %>', '<%= gor.getKota() %>', <%= gor.getRating() %>, <%= gor.getHarga() %>, '<%= base64Image %>')">Update</button>
                    <button class="btn-more" id="delete" onclick="location.href='DeleteGorServlet?id=<%= gor.getId_Gor() %>'">Delete</button>
                </td>
            </tr>
            <% 
                    }
                } 
            %>
        </table>
        <button class="btn-addgor" onclick="openAddModal()">Add GOR</button>
    </div>

    <!-- Add GOR Modal -->
    <div id="addModal" class="modal">
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
                <label for="image">Image:</label><br>
                <input type="file" id="image" name="image" accept="image/*" required><br>
                <input type="hidden" id="imageBase64" name="imageBase64"><br>
                <button type="submit">Add GOR</button>
            </form>
        </div>
    </div>

    <!-- Update GOR Modal -->
    <div id="updateModal" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeUpdateModal()">&times;</span>
            <h2>Update GOR</h2>
            <form id="updateForm" action="UpdateGorServlet" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" id="updateId" name="id">
                <label for="updateNamaGor">Nama GOR:</label><br>
                <input type="text" id="updateNamaGor" name="namaGor" required><br>
                <label for="updateKota">Kota:</label><br>
                <input type="text" id="updateKota" name="kota" required><br>
                <label for="updateRating">Rating:</label><br>
                <input type="number" step="0.1" id="updateRating" name="rating" required><br>
                <label for="updateHarga">Harga:</label><br>
                <input type="number" step="0.01" id="updateHarga" name="harga" required><br>
                <label for="updateImage">Image:</label><br>
                <input type="file" id="updateImage" name="image" accept="image/*"><br>
                <input type="hidden" id="updateImageBase64" name="imageBase64"><br>
                <button type="submit">Update GOR</button>
            </form>
        </div>
    </div>

    <script>
        // Get the modals
        var addModal = document.getElementById('addModal');
        var updateModal = document.getElementById('updateModal');

        // Open the add modal
        function openAddModal() {
            addModal.style.display = "block";
        }

        // Close the add modal
        function closeAddModal() {
            addModal.style.display = "none";
        }

        // Open the update modal with pre-filled data
        function openUpdateModal(id, namaGor, kota, rating, harga, image) {
            document.getElementById('updateId').value = id;
            document.getElementById('updateNamaGor').value = namaGor;
            document.getElementById('updateKota').value = kota;
            document.getElementById('updateRating').value = rating;
            document.getElementById('updateHarga').value = harga;
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
            if (event.target == addModal) {
                closeAddModal();
            }
            if (event.target == updateModal) {
                closeUpdateModal();
            }
        }
    </script>
</body>
</html>
<%@include file="Footer.jsp" %>
