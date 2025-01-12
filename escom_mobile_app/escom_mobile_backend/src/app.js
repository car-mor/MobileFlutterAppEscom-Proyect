import express from "express"
import morgan from "morgan"
import cors from "cors"
import dotenv from 'dotenv'

import { alumnoRouter } from './routes/alumno.routes.js'
import { profesorRouter } from "./routes/profesor.routes.js"
import { authRouter } from "./routes/auth.routes.js"

dotenv.config()
export const crearApp=(Modelos)=>{
    const app=express()


    app.use ((req, res, next)=>{
        res.header('Access-Control-Allow-Origin', '*'); 
        res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
        next()
    })

    app.use(cors({
        origin:["http://localhost:5173","http://192.168.1.70:5173"],
        methods: "GET, HEAD, PUT, PATCH, POST, DELETE",
        credentials: true
    }))

    app.set("port",process.env.PORT || 3000)
    app.use(morgan("dev"))
    app.use(express.urlencoded({
        extended: true
    }))
    app.use(express.json())

    app.use('/api/alumno',alumnoRouter(Modelos))
    app.use('/api/profesor',profesorRouter(Modelos))
    app.use('/api/auth',authRouter(Modelos))

    

    app.listen(app.get("port"),()=>{
        console.log(`server listen on port ${app.get("port")}`)
    })
}