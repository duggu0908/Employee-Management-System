<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employee Management System</title>
    <link id="theme-style" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Custom styles */
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            background-color: #0d6efd !important;
        }
        .navbar-brand {
            color: #fff !important;
            font-weight: bold;
        }
        .navbar-nav .nav-link {
            color: #fff !important;
        }
        .card-header {
            background-color: #0d6efd !important;
            color: #fff;
            font-weight: bold;
        }
        /* Dark mode styles */
        body.dark-mode {
            background-color: #212529;
            color: #fff;
        }
        body.dark-mode .navbar {
            background-color: #343a40 !important;
        }
        body.dark-mode .navbar-brand,
        body.dark-mode .navbar-nav .nav-link {
            color: #fff !important;
        }
        body.dark-mode .card-header {
            background-color: #343a40 !important;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Employee Management System</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="home">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addEmp">Add Employee</a>
                </li>
            </ul>
        </div>
        <div class="form-check form-switch">
            <input class="form-check-input" type="checkbox" id="darkModeToggle">
            <label class="form-check-label" for="darkModeToggle">Dark Mode</label>
        </div>
    </div>
</nav>

<div class="container mt-4">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">
                    <h4>All Employee Details</h4>
                    <c:if test="${not empty msg}">
                        <h5>${msg}</h5>
                        <c:remove var="msg" />
                    </c:if>
                </div>
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">Id</th>
                                <th scope="col">Full Name</th>
                                <th scope="col">Address</th>
                                <th scope="col">Email</th>
                                <th scope="col">Password</th>
                                <th scope="col">Designation</th>
                                <th scope="col">Salary</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${empList}" var="emp">
                                <tr>
                                    <td>${emp.id}</td>
                                    <td>${emp.fullName}</td>
                                    <td>${emp.address}</td>
                                    <td>${emp.email}</td>
                                    <td>${emp.password}</td>
                                    <td>${emp.designation}</td>
                                    <td>${emp.salary}</td>
                                    <td>
                                        <a href="editEmp/${emp.id}" class="btn btn-sm btn-primary">Edit</a>
                                        <a href="deleteEmp/${emp.id}" class="btn btn-sm btn-danger">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-vZYsh0TCIv3HjU6vFt6AeQcmH1Fo2pUkkwI1Tj0edUlgT1zVPC8DHqvPlB8XyTsO" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-ueM5P4NhWIDGFe4Nt2BxGwDKP8w4K4z/zBh8W2I+eBocV+2PMpA6HVfI1XSdHoJR" crossorigin="anonymous"></script>
<script>
    document.getElementById('darkModeToggle').addEventListener('change', function() {
        if (this.checked) {
            document.body.classList.add('dark-mode');
        } else {
            document.body.classList.remove('dark-mode');
        }
    });
</script>
</body>
</html>
