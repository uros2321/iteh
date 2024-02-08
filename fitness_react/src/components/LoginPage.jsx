import axios from 'axios';
import React from 'react'
import {useState} from 'react'
import {useNavigate} from 'react-router-dom'

function LoginPage({addToken, addUser}){

    const [userData, setUserData]=useState({
        email: "",
        password: "",
    })

    function handleInput(e){
        let newUserData=userData;
        newUserData[e.target.name] = e.target.value;
        setUserData(newUserData)
    }

    

    let navigate = useNavigate()

    function handleLogin(e){
        e.preventDefault()
        axios.post("api/login", userData)
        .then((res)=>{
            if(res.data.success === true){
                console.log(res.data)
                console.log(userData)
                window.sessionStorage.setItem("auth_token", res.data.access_token)
                addToken(res.data.access_token)
                addUser(userData)
                navigate("/")
            }
        }).catch(function (error) {
          console.log(error);
      })
    }

    return (
    <>
        <div className='login-body'>
        <div className="Auth-form-container">
      <form className="Auth-form" onSubmit={handleLogin}>
        <div className="Auth-form-content">
          <h3 className="Auth-form-title">Login</h3>
          <div className="form-group mt-3">
            <label>Email adresa</label>
            <input
              type="email"
              className="form-control mt-1"
              placeholder="Unesi email"
              name='email'
              onInput={handleInput}
            />
          </div>
          <div className="form-group mt-3">
            <label>Lozinka</label>
            <input
              type="password"
              className="form-control mt-1"
              placeholder="Unesi lozinku"
              name='password'
              onInput={handleInput}
            />
          </div>
          <div className="button-div">
            <button type="submit" className="btn-login">
              Potvrdi
            </button>
          </div>
        </div>
      </form>
    </div>
        </div>
    </>
        
    );
}

export default LoginPage