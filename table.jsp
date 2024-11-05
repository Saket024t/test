<%-- 
    Document   : table
    Created on : Oct 26, 2024, 9:58:48 PM
    Author     : saket
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        <style>
            .kk{
                display:none;
            }
            .dd{
                display:block;
            }
        </style>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <% for(int i=1; i<=20 ; i++)
        { %>
        
        <div class= "<%= "aa bb" + i %>">
            <table  >
            
            
            
            <tr>
                <th>head1</th>
                <th>head2</th>
            </tr>
            
            <% for(int j=1; j<=10 ; j++)
              { %>
              <tr>
                  
                  <th><%= i +" " + j%></th>
                  <th><%= i +" " + j%></th>
                  
              </tr>
              
              
            <% }%>
            
        </table>
        </div>
        
        
         
        <%
        }%>
        <div id="page-div">
        <button class="pre" onclick="fun(-3)">ddd</button>
        <button id="a1" onclick="fun(-1)" value=1>1</button>
        <button id="a2" onclick="fun(0)" value=2>2</button>
        <button id="a3" onclick="fun(+1)" value=3>3</button>
        <button class="next" onclick="fun(-2)">gggg</button>
        </div>
        
        
        
        
        <script>
            
            let cnt = 1;
            let j = document.getElementsByClassName("aa");
            console.log(j.valueOf());
            let n = j.length;
            function fun(h){
                for(let k =0 ; k<j.length ; k++)
            {
                j[k].classList.add("kk");
            }
            if(h==-3){
                if(cnt >1)cnt--;
            }
            else if(h==-2)
            {
                if(cnt < n)cnt++;
            }
            else if(h==-1)
            {
                if(cnt>1)
                    cnt = cnt +h;
            }
            else if(h==1)
            {
                if(cnt<n)
                    cnt = cnt +h;
            }
            else
            {
                //if(cnt>1 && cnt<n)
                if(n>2){
                    if(cnt==1)cnt++;
                else if(cnt==n)cnt--;
                cnt = cnt+h;
                }
                if(n==2)
                {
                    if(cnt==1)cnt++;
                    cnt = cnt+h;
                }
                
            }
            if(cnt ==2 || cnt==1)
            {
                console.log("lol");
                document.getElementById("a1").innerHTML =1;
                document.getElementById("a2").innerHTML =2; 
                document.getElementById("a3").innerHTML =3;
            }
            else if(cnt >2 && cnt<n)
            {
                console.log("lol");
                document.getElementById("a1").innerHTML =""+ cnt-1;
                document.getElementById("a2").innerHTML =""+ cnt; 
                document.getElementById("a3").innerHTML =""+ (cnt+1);
            }
            
            console.log(cnt + " " + n);
            
            let s = "bb" + cnt;
            let jadu = document.getElementsByClassName(s);
            jadu[0].classList.toggle("kk");
            
            }
            
            if(n==1)
            {
                document.getElementById("page-div").style.display = "none";
            }
            else if(n==2)
            {
//                document.getElementById("a1").style.display = "none";
//                document.getElementById("a2").style.display = "none";
                document.getElementById("a3").style.display = "none";
            }
            else
            {
                
            }
            
            
            </script>
    </body>
</html>
