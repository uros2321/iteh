import axios from 'axios';
import React from 'react'
import {useState, useEffect} from 'react'
import {useNavigate} from 'react-router-dom'
// import CategoriesCombo from './CategoriesCombo';

function RegisterPage(){

  const [categories, setCategories]=useState()
    useEffect(()=>{
        if(categories==null){
            axios.get("api/categories")
                .then((res)=>{
                setCategories(res.data.categories)
                })
        }
    },[categories])

    const [userData, setUserData]=useState({
        firstname: "",
        lastname: "",
        birthday: "",
        category: "",
        email: "",
        password: "",
    })

    function handleInput(e){
        let newUserData=userData;
        newUserData[e.target.name] = e.target.value;
        setUserData(newUserData)
    }

    function handleComboBox(e){
      let newUserData=userData
      newUserData["category_id"]=e.target.value
    }

    let navigate = useNavigate()

    function handleRegister(e){
        e.preventDefault()
        axios.post("api/register", userData)
        .then((res)=>{
            console.log(res.data)
            navigate("/login")
        }).catch((e)=>console.log(e))
    }



    return (
    <>
        <div className='login-body'>
        <div className="Auth-form-container">
      <form className="Auth-form" onSubmit={handleRegister}>
        <div className="Auth-form-content">
          <h3 className="Auth-form-title">Registracija</h3>
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
            <label>Datum rodjenja</label>
            <input
              type="date"
              className="form-control mt-1"
              placeholder="Unesi datum rodjenja"
              onInput={handleInput}
              name="birthday"
            />
          </div>
          <div className="form-group mt-3">
            <label>Kategorija</label>
            <select onChange={handleComboBox} className='combobox' name="" id="">
            {categories==null ? <></> : categories.map((category)=>(
                <option key={category.id} value={category.id}>
                {category.name}
              </option>
            ))}
            </select>
          </div>
          <div className="form-group mt-3">
            <label>Email adresa</label>
            <input
              type="email"
              className="form-control mt-1"
              placeholder="Unesi email"
              onInput={handleInput}
              name="email"
            />
          </div>
          <div className="form-group mt-3">
            <label>Lozinka</label>
            <input
              type="password"
              className="form-control mt-1"
              placeholder="Unesi lozinku"
              onInput={handleInput}
              name="password"
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

export default RegisterPage