const express = require('express')
const app = express()
const port = 4000

// app.get('/', (req, res) => {
//   res.send('This is Home')
// })

// app.get('/about', (req, res) => {
//   res.send('This is About')
// })

// app.get('/project', (req, res) => {
//   res.send('This is Project')
// })

// app.get('/services', (req, res) => {
//   res.send('This is services')
// })

// app.get('/contact', (req, res) => {
//   res.send('This is contact')
// })

// app.get('/api2', (req, res) => {
//   res.json({message: 'API 2'})
// })


// app.get('/api', (req, res) => {
//   res.json([
//     {
//         name: "Ahmed",
//         email: "ahmed@gmail.com",
//         status: "developer",
//     },

//      {
//         name: "ali",
//         email: "ali@gmail.com",
//         status: "frontend developer",
//     },

//      {
//         name: "Zain",
//         email: "zain@gmail.com",
//         status: "developer",
//     },

//      {
//         name: "Ahmed",
//         email: "ahmed@gmail.com",
//         status: "developer",
//     },

//      {
//         name: "Ahmed",
//         email: "ahmed@gmail.com",
//         status: "developer",
//     },

//   ])

// })


//  middleware 
// const check = (req,res,next)=>{
//   console.log("checking....");
// }



// const express = require("express");
// const path = require("path");

// const app = express();

// app.use(express.static(path.join(__dirname, "public")));

// const ageCheck = (req, res, next) => {
//     const age = req.query.age;

//     if (!age) {
//         return res.send(`
//             <h1>Please Enter Your Age</h1>
//             <a href="/">Go Back</a>
//         `);
//     }

//     if (age < 18) {
//         return res.send(`
//             <h1>You are not Eligible</h1>
//             <a href="/">Go Back</a>
//         `);
//     }

//     next();
// };

// app.get("/home", ageCheck, (req, res) => {
//     res.send(`
//         <h1>Welcome to Home Page 🎉</h1>
//     `);
// });

// app.listen(3000, () => {
//     console.log("Server running on port 3000");
// });
// app.get('/home', ageCheck, (req, res) => {
//     res.send('This is Home Page');
// });


// fist route 

// app.use(express.json());

// app.post('/users' , (req, res) => {
//     const name = req.body.name
//     res.send( `Welcome ${name}`)
// })


// Json data ko read krny k lia

app.use(express.json());


// ROUTE b (POST)

let allstudents = []

app.post('/students', (req, res) => {

  const student = {
    id: allstudents.length + 1,
    name: req.body.name,
    course: req.body.course,
  }

  allstudents.push(student)

  res.json({
    message: "student added successfully",
    student: allstudents
  })

})

app.get('/students', (req, res) => {
  res.json(allstudents)
})


app.put('/students/:id', (req, res) => {

  student = allstudents.find(
    s => s.id == req.params.id);

  if (!student) {
    return res.send("Student Not Found")
  }

  student.name = req.body.name;
  student.course = req.body.course;

  res.json({
    message: "student added successfully",
    student: allstudents
  })

})


app.delete('/students/:id', (req, res) => {

   student = allstudents.filter(
    s => s.id !=Number (req.params.id) );

  res.json({
    message: "student deleted successfully",
    student: allstudents
  })

})


app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
})
