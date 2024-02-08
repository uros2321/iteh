import axios from 'axios';
import React from 'react'
import {useState, useEffect} from 'react'
import {useNavigate} from 'react-router-dom'
// import CategoriesCombo from './CategoriesCombo';

function InsertCoach(){

  const [coachData, setCoachData]=useState({
    firstname: "",
    lastname: "",
    started: "",
    experience: "",
})


  function handleInput(e){
    let newCoachData=coachData;
    newCoachData[e.target.name] = e.target.value;
    setCoachData(newCoachData)
}

let navigate = useNavigate()

function handleInsertCoach(e){
  e.preventDefault()
  axios.post("api/coaches", coachData, {headers:{'Authorization': `Bearer ${ window.sessionStorage.getItem('auth_token')}`} })
  .then((res)=>{
    if(res.data.success==true){
      alert(res.data[0])
      navigate("/admin")
    }else{
      alert("Nije uspesno dodavanje!")
    }
  }).catch((e)=>console.log(e))
}



    return (
    <>
        <div className='login-body'>
        <div className="Auth-form-container">
      <form className="Auth-form" onSubmit={handleInsertCoach}>
        <div className="Auth-form-content">
          <h3 className="Auth-form-title">Unesi podatke o treneru</h3>
          <div className="form-group mt-3">
            <label>Ime</label>
            <input
              type="text"
              className="form-control mt-1"
              placeholder="Unesi ime"
              onInput={handleInput}
              name="firstname"
            />
          </div>
          <div className="form-group mt-3">
            <label>Prezime</label>
            <input
              type="text"
              className="form-control mt-1"
              placeholder="Unesi prezime"
              onInput={handleInput}
              name="lastname"
            />
          </div>
          <div className="form-group mt-3">
            <label>Datum početka</label>
            <input
              type="date"
              className="form-control mt-1"
              placeholder="Unesi datum početka"
              onInput={handleInput}
              name="started"
            />
          </div>
          
          <div className="form-group mt-3">
            <label>Iskustvo</label>
            <input
              type="text"
              className="form-control mt-1"
              placeholder="Unesi iskustvo"
              onInput={handleInput}
              name="experience"
            />
          </div>
          
          <div className="button-div">
            <button type="submit" className="btn-login">
              Dodaj
            </button>
          </div>
          
        </div>
      </form>
    </div>
        </div>
    </>
        
    );
}

export default InsertCoach