require("dotenv").config(); 
const express = require('express');
const { Server } = require('ws');
const crypto = require('crypto');
const mongoose = require('mongoose');

const User = require('./user.js'); // Locate file

const PORT = process.env.PORT || 3000; //port for https

const server = express();
server.listen(3000, () => console.log("Server is Running"));

const wss = new Server({ server });

const connectionpOptions = {
    dbName: "Educate"
}
// TODO: Change connection
mongoose.connect(process.env.DATABASE_URI, connectionpOptions)
    .then((_) => console.log("Connected to database."))
    .catch((e) => console.log("Error:", e)); // Open MongoDB.

wss.on('connection', function(ws, req) {
    ws.on('message', message => { // If there is any message
        var datastring = message.toString();
        if(datastring.charAt(0) == "{"){ // Check if message starts with '{' to check if it's json
            datastring = datastring.replace(/\'/g, '"');
            var data = JSON.parse(datastring)
            if(data.auth == "chatappauthkey231r4"){
                // TODO: Create login function
            }
        }
    }) 
})

const stud = new User({
    email: "sichibukai.gmail.com",
    username: "BuggyDClown",
    role: "Student",
    password:"ClownEmperor",
});
stud
    .save()
    .then(
        () => console.log("entry added"),
        (err) => console.log(err)
    );

server.get("/",(req,res)=>{
    User.find((err,val)=>{
        if(err){
            console.log(err)
        }else{
            res.json(val)
        }
    })
})

// if (data.cmd === 'signup'){ // On Signup
//     // If mail doesn't exists it will return null
//     User.findOne({email: data.email}).then((mail) => {
//         // Check if email doesn't exist.
//         if (mail == null){
//             User.findOne({username: data.username}).then((user) => {
//                     // Check if username doesn't exists.
//                     if (user == null){
//                         const hash = crypto.createHash("md5")
//                         let hexPwd = hash.update(data.hash).digest('hex');
//                         var signupData = "{'cmd':'"+data.cmd+"','status':'succes'}";
//                         const user = new User({
//                             email: data.email,
//                             username: data.username,
//                             password: hexPwd,
//                             role: data.role,
//                         });
//                         // Insert new user in db
//                         user.save();
//                         // Send info to user
//                         ws.send(signupData);
//                 } else{
//                     // Send error message to user.
//                     var signupData = "{'cmd':'"+data.cmd+"','status':'user_exists'}";  
//                     ws.send(signupData);  
//                 }
//             });
//         } else{
//             // Send error message to user.
//             var signupData = "{'cmd':'"+data.cmd+"','status':'mail_exists'}";    
//             ws.send(signupData);
//         }
//     });
// }

// if (data.cmd === 'login'){
//     // Check if email exists 
//     User.findOne({email: data.email}).then((r) => {
//         // If email doesn't exists it will return null
//         if (r != null){
//             const hash = crypto.createHash("md5")
//             // Hash password to md5
//             let hexPwd = hash.update(data.hashcode).digest('hex');
//             // Check if password is correct
//             if (hexPwd == r.password) {
//                 // Send username to user and status code is succes.
//                 var loginData = '{"username":"'+r.username+'","status":"succes"}';
//                 // Send data back to user
//                 ws.send(loginData);
//             } else{
//                 // Send error
//                 var loginData = '{"cmd":"'+data.cmd+'","status":"wrong_pass"}';
//                 ws.send(loginData);
//             }
//         } else{
//             // Send error
//             var loginData = '{"cmd":"'+data.cmd+'","status":"wrong_mail"}';
//             ws.send(loginData);
//         }
//     });
// } 