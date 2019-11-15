**Spring Session提供了用于管理用户会话信息的API和实现，同时还使得支持群集，而不依赖于特定于应用程序容器的解决方案。它还提供透明集成：**

* [HttpSession](/session/httpsession.md)：允许替换`HttpSession`以应用程序容器中立的方式，支持在头文件中提供会话ID以使用RESTful API。

* [WebSocket](/session/websocket.md)：提供`HttpSession`在接收WebSocket消息时保持活动的能力

* [WebSession](/session/websocket.md)：允许以`WebSession`应用程序容器中立的方式替换Spring WebFlux。



