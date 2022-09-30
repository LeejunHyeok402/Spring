<%@page import="java.util.Enumeration"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Form Processing</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>요청 파라미터 이름</th>
			<th>요청 파라미터 값</th>
			<%
				request.setCharacterEncoding("UTF-8");
				//?id=a001&name=개똥이
				//getParameterName() : 모든 입력 양식의 요청 파라미터 이름을
				// 순서에 상관없이 Enumeration(열거형) 형태로 전달받음
				Enumeration paramNames =  request.getParameterNames();
				//hasMoreElements :열거형 요소가 있으면 true,없으면 false 반환
				//전송괸 요청 파라미터가 없을 때까지 반복
				while(paramNames.hasMoreElements()){
					//nextElement() : 열거형 요소를 반환해줌
					//폼 페이지에서 전송된 요청 파라미터의 이름을 가져옴
					String name=(String)paramNames.nextElement();
					
					if(name.equals("hobby")){
						String[] paramValue = request.getParameterValues(name);
							out.print("<tr><td>"+name+"</td><td>");
						if(paramValue != null){
							for(String str :paramValue){
								out.print(" "+str);
							}
							out.print("</td><tr>");
						}
					}else{
						String paramValue =request.getParameter(name);
						out.println("<tr><td>"+name+"</td><td>"+paramValue+"</td></tr>");						
					}
				}
			%>
		</tr>
	</table>
</body>
</html>