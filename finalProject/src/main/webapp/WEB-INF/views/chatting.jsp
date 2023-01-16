<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-2.2.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<script>
    /* Chatting Start */
    var stompClient = null;
    var gid = '<c:out value="${gid}"/>';
    var nname = '<c:out value="${nname}"/>';
    var profile = '<c:out value="${profile}"/>';
    var chatList = new Array(); // 전체 카테고리 리스트 비동기로 받아오기
    
    <c:forEach items="${filecontentlist}" var="filecontent">
        chatList.push("${filecontent}");
    </c:forEach>
    
    //console.log(gid);
    $(function(){
        connect();
        
        $.each(chatList, function(index, value){
            chatList[index] = chatList[index].split('|');
            //console.log(chatList[index]);
            var chatListIndex = chatList[index]
            
            var chat_list_div = "";
            chat_list_div += '<img class="chatting-profile-img" src="${pageContext.request.contextPath}/images/profile/' + chatListIndex[0] + '">';
            chat_list_div += '<div class="chatting-text-div">';
            chat_list_div += '<p class="chatting-userid">';
            chat_list_div += chatListIndex[1] + '<span class="chatting-time">' + chatListIndex[2] + '</span>';
            chat_list_div += '</p>';
            chat_list_div += '<span class="chatting-text">';
            chat_list_div += chatListIndex[3];
            chat_list_div += '</span>';
            chat_list_div += '</div>';      
            
            //console.log(chat_list_div);
            $(".chatting-contents").append(chat_list_div);
            
        });
    });
    // 채팅방 연결
    function connect() {
        //console.log("connect");
        // WebSocketMessageBrokerConfigurer의 registerStompEndpoints() 메소드에서 설정한 endpoint("/endpoint")를 파라미터로 전달
        var ws = new SockJS("http://localhost:8050/final/chat.so");
        stompClient = Stomp.over(ws);
        stompClient.connect({}, function(frame) {
            // 메세지 구독
            // WebSocketMessageBrokerConfigurer의 configureMessageBroker() 메소드에서 설정한 subscribe prefix("/subscribe")를 사용해야 함
            stompClient.subscribe('/subscribe/chat/' + gid, function(message) {
                console.log(message.body);
                
                var new_chat = JSON.parse(message.body);
                //console.log(new_chat.nname);
                var chat_div = "";
                chat_div += '<img class="chatting-profile-img" src="${pageContext.request.contextPath}/images/profile/' + new_chat.profile + '">';
                chat_div += '<div class="chatting-text-div">';
                chat_div += '<p class="chatting-userid">';
                chat_div += new_chat.nname + '<span class="chatting-time">' + new_chat.datetime + '</span>';
                chat_div += '</p>';
                chat_div += '<span class="chatting-text">';
                chat_div += new_chat.content;
                chat_div += '</span>';
                chat_div += '</div>';      
                $(".chatting-contents").append(chat_div);
                
            });
            
            
        });
        
    }
    // 채팅 메세지 전달
    function sendMessage() {
        //console.log("click");
        
        var str = $("#chat-textbox-text").html().trim();
        str = str.replace(/ /gi, '&nbsp;')
        str = str.replace(/\n|\r/g, '<br>');
        console.log(str);
        if(str.length > 0) {
            // WebSocketMessageBrokerConfigurer의 configureMessageBroker() 메소드에서 설정한 send prefix("/")를 사용해야 함
            stompClient.send("/chat/" + gid, {}, JSON.stringify({
                   content: str,
                   nname: nname,
                   profile: profile
            }));
        }
    }
    // 채팅방 연결 끊기
    function disconnect() {
        stompClient.disconnect();
    }
    /* Chatting End */
 
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button onclick="connect()">connect</button>
	<div class="chatting-contents"></div>
	<input id="chat-textbox-text">
	<button onclick="sendMessage()">sendMessage</button>
	<button onclick="disconnect()">disconnect</button>
</body>
</html>