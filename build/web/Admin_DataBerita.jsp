<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="HeaderAdmin.jsp" %>
<%@page import="Model.Berita" %>
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
            <h1>Data Berita</h1>
            <button class="btn-addgor" onclick="openAddModal()">Add Berita</button>
        </div>
        <table border="1">
            <tr>
                <th>Gambar</th>
                <th>Judul</th>
                <th>Penulis</th>
                <th>Tanggal Rilis</th>
                <th>Konten</th>
                <th>Actions</th>
            </tr>
            <%
                ArrayList<Berita> beritaList = (ArrayList<Berita>) request.getAttribute("beritaList");
                if (beritaList != null) {
                    for (Berita berita : beritaList) {
                    String kontenstrim = berita.getKonten().replaceAll("\n","");
            %>
            <tr>
                <td>
                    <%
                        String base64Image = berita.getImageBase64();
                        if (base64Image != null) {
                    %>
                    <img class="image-gor" src="data:image/jpeg;base64,<%= base64Image %>" alt="Gambar Berita" width="250" height="auto">
                    <%
                        } else {
                    %>
                    <img src="default-image.jpg" alt="Gambar Berita" width="400">
                    <%
                        }
                    %>
                </td>
                <td class="isi-td"><%= berita.getJudul() %></td>
                <td class="isi-td"><%= berita.getPenulis() %></td>
                <td class="isi-td"><%= berita.getTanggal() %></td>
                <td class="konten-td"><%= berita.getKonten().replace("\n","<br>")%></td>
                <td class="actions-btn">
                    <button class="btn-more" id="update" onclick="openUpdateModal(<%= berita.getId()%>, '<%= berita.getJudul()%>', '<%= berita.getPenulis()%>', '<%= berita.getTanggal()%>', '<%= kontenstrim %>', '<%= base64Image %>')">Update</button>
                    <button class="btn-more" id="delete" onclick="openDeleteModal(<%= berita.getId()%>)">Delete</button>
                </td>
            </tr>
            <% 
                    }
                } 
            %>
        </table>
    </div>

    <!-- Add Berita Modal -->
    <div id="addModalBerita" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeAddModal()">&times;</span>
            <h2>Add Berita</h2>
            <form action="BeritaDataServlet" method="post">
                <input type="hidden" name="action" value="add">
                <label for="judul">Judul:<span>*</span></label><br>
                <input type="text" id="judul" name="judul" required><br>
                <label for="penulis">Penulis:<span>*</span></label><br>
                <input type="text" id="penulis" name="penulis" required><br>
                <label for="tanggal">Tanggal:<span>*</span></label><br>
                <input type="date" id="tanggal" name="tanggal" required><br>
                <label for="konten">Konten:<span>*</span></label><br>
                <textarea rows="3" cols="16" id="konten" name="konten" required></textarea><br>
                <label for="image">Image:<span>*</span></label><br>
                <input type="file" id="image" name="image" accept="image/*" required><br>
                <input type="hidden" id="imageBase64" name="imageBase64"><br>
                <button type="submit">Add Berita</button>
            </form>
        </div>
    </div>

    <!-- Update GOR Modal -->
    <div id="updateModalBerita" class="modal">
        <div class="modal-content">
            <span class="close" onclick="closeUpdateModal()">&times;</span>
            <h2>Update Berita</h2>
            <form id="updateForm" action="UpdateBeritaServlet" method="post">
                <input type="hidden" name="action" value="update">
                <input type="hidden" id="updateId" name="id">
                <label for="updateJudul">Judul:</label><br>
                <input type="text" id="updateJudul" name="judul" required><br>
                <label for="updatePenulis">Penulis:</label><br>
                <input type="text" id="updatePenulis" name="penulis" required><br>
                <label for="updateTanggal">Tanggal:</label><br>
                <input type="date" id="updateTanggal" name="tanggal" required><br>
                <label for="updateKonten">Konten:</label><br>
                <textarea rows="3" cols="16" id="updateKonten" name="konten" required></textarea><br>
                <label for="updateImage">Image:</label><br>
                <input type="file" id="updateImage" name="image" accept="image/*"><br>
                <input type="hidden" id="updateImageBase64" name="imageBase64"><br>
                <button type="submit">Update Berita</button>
            </form>
        </div>
    </div>
    
    <div id="deleteModalGor" class="modal">
        <div class="modal-confirmation">
            <span class="close" onclick="closeDeleteModal()">&times;</span>
            <h2>Confirm Delete</h2>
            <p>Are you sure you want to delete this Berita?</p>
            <div class="button-container">
                <button id="confirmDelete" class="btn-delete">Delete</button>
                <button onclick="closeDeleteModal()" class="btn-cancel">Cancel</button>
            </div>
        </div>
    </div>

    <script>
        // Get the modals
        var addModal = document.getElementById('addModalBerita');
        var updateModal = document.getElementById('updateModalBerita');
        var deleteModal = document.getElementById('deleteModalGor');
        var deleteButton = document.getElementById('confirmDelete');
        
        var today = new Date();
        var dd = String(today.getDate()).padStart(2, '0');
        var mm = String(today.getMonth() + 1).padStart(2, '0'); // January is 0!
        var yyyy = today.getFullYear();

        var formattedDate = yyyy + '-' + mm + '-' + dd;
        document.getElementById('tanggal').value = formattedDate;
        document.getElementById('tanggal').setAttribute('min', formattedDate);
        document.getElementById('updateTanggal').value = formattedDate;
        document.getElementById('updateTanggal').setAttribute('min', formattedDate);
        
        // Open the delete modal with the id of the GOR to be deleted
        function openDeleteModal(id) {
            deleteModal.style.display = "block";
            deleteButton.onclick = function() {
                location.href = 'DeleteBeritaServlet?id=' + id;
            };
        }

        // Close the delete modal
        function closeDeleteModal() {
            deleteModal.style.display = "none";
        }

        // Open the add modal
        function openAddModal() {
            addModal.style.display = "block";
        }

        // Close the add modal
        function closeAddModal() {
            addModal.style.display = "none";
        }

        // Open the update modal with pre-filled data
        function openUpdateModal(id, judul, penulis, tanggal, konten, image) {
            document.getElementById('updateId').value = id;
            document.getElementById('updateJudul').value = judul;
            document.getElementById('updatePenulis').value = penulis;
            document.getElementById('updateTanggal').value = tanggal;
            document.getElementById('updateKonten').value = konten.replaceAll("<br>","\n");
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
            if (event.target == deleteModal) {
                closeDeleteModal();
            }
        }
    </script>
</body>
</html>
<%@include file="Footer.jsp" %>