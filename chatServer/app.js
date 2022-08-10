const express = require("express");
const app = express();
const http = require("http");
const server = http.createServer(app);
const { Server } = require("socket.io");
var io = new Server(server);

const clients = {};

io.on("connect", (socket) => {
  console.log("connected");
  var username = socket.handshake.query.username;
  console.log("user :", username);
  clients[username] = socket;
  socket.on("message", (msg)=>{
    console.log(msg);
    const message = {
        "message": `${msg.message}`,
        "sender": `${msg.sender}`,
        "target": `${msg.targetId}`,
        "sentAt": Date.now(),
    }
    if(clients[msg.targetId]) io.emit("messageFromServer", message);
  });
});

server.listen(3000, () => {
  console.log("server started");
});
