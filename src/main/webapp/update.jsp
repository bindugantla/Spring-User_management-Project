<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Page</title>
</head>

<body>
<h1>Update User Details</h1>
<form action="update">
<input type="text" value="${u.getId() }" name="id" placeholder="Enter new id"><br><br>
<input type="text" value="${u.getName() }" name="name" placeholder="Enter new name"><br><br>
<input type="text" value="${u.getEmail() }" name="email" placeholder="Enter new email"><br><br>
<input type="text" value="${u.getPhone() }" name="phone" placeholder="Enter new phone"><br><br>
<input type="text" value="${u.getAge() }" name="age" placeholder="Enter new age"><br><br>
<input type="text" value="${u.getPassword() }"  name="password" placeholder="Enter new password"><br><br>
<button type="submit">Update</button>
</form>

</body>
</html>