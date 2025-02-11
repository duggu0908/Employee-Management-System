<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
rel="stylesheet" 
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
crossorigin="anonymous">
</head>
<body>
   <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Emp management System</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" 
              aria-current="page" href="home">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="addEmp"> Add Emp</a>
        </li>
  
      </ul>
     
    </div>
  </div>
</nav>
<div class="container">
<div class="row">
 <div class="card">
 <div class="card-header">
   <h3> Edit Emp</h3>
   <c:if test="${not empty msg }">
       <h5>${msg }</h5>
       <c:remove var="msg" />
   </c:if>
  </div>
  <div class="card-body">
     <form action="${pageContext.request.contextPath}/updateEmp" method="post">
     <input type="hidden" name=id value="${emp.id }">
        <div class = "mb-3">
           <label>Enter full Name</label>
           <input type="text" name="fullName" class="form-control" value="${emp.fullName }">
        </div>
        
        <div class = "mb-3">
           <label>Enter Address</label>
           <input type="text" name="address" class="form-control" value="${emp.address }">
        </div>
        
        <div class = "mb-3">
           <label>Enter Email</label>
           <input type="text" name="email" class="form-control"value="${emp.email }">
        </div>
        
        <div class = "mb-3">
           <label>Enter password</label>
           <input type="text" name="password" class="form-control" value="${emp.password }">
        </div>
        
        <div class = "mb-3">
           <label>Enter designation</label>
           <input type="text" name="designation" class="form-control" value="${emp.designation }">
        </div>
        
        <div class = "mb-3">
           <label>Enter salary</label>
           <input type="text" name="salary" class="form-control" value="${emp.salary }">
        </div>
        
        <button class="btn btn-primary">update</button>
     </form>
  </div>
 
 </div>
</div>
</div>
</body>
</html> 