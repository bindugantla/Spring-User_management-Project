<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Management</title>
<style>
     h2{
      text-align:center;
      color:orange;
     
     }
    body {
        font-family: Arial, sans-serif;
        margin: 20px;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }
    
    table, th, td {
        border: 1px solid #ddd;
    }
    
    th, td {
        padding: 15px;
        text-align: left;
    }
    
    th {
        background-color: #f2f2f2;
    }
    
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    
    tr:hover {
        background-color: #e9e9e9;
    }
    
    .action-button {
        background-color: #007bff; /* Blue background */
        color: white; /* White text */
        border: none; /* Remove default border */
        padding: 8px 12px; /* Button padding */
        cursor: pointer; /* Pointer cursor on hover */
        border-radius: 4px; /* Rounded corners */
        font-size: 14px; /* Font size */
        transition: background-color 0.3s ease; /* Smooth transition */
    }
    
    .action-button:hover {
        background-color: #0056b3; /* Darker blue on hover */
    }
    
    .delete-button {
        background-color: #dc3545; /* Red background */
    }
    
    .delete-button:hover {
        background-color: #c82333; /* Darker red on hover */
    }
    #cd{
    margin-left:75%;
    color:blue;
     background-color:  #0056b3; 
    }
</style>
</head>

<body>

<h2 >User List</h2>
<a href="regpage" id="cd"><button>Create User</button></a>

<table>
   <thead>
       <tr>
          
           <th>Name</th>
           <th>Email</th>
           <th>Phone</th>
           <th>Age</th>
          
           <th colspan="2">Action</th>
       </tr>
   </thead>
   <tbody>
       <c:forEach var="u" items="${users}">
           <tr>
              
               <td>${u.getName()}</td>
               <td>${u.getEmail()}</td>
               <td>${u.getPhone()}</td>
               <td>${u.getAge()}</td>
               
               <td>
                  <a href="updatepage?id=${u.getId()}"> <button class="action-button">Update</button></a>
               </td>
               <td>
                   <a href="delete?id=${u.getId()}">
                       <button class="action-button delete-button">Delete</button>
                   </a>
               </td>
           </tr>
       </c:forEach>
   </tbody>
</table>
     
</body>
</html>
