import axios from 'axios';
import React from 'react'
import {useState, useEffect} from 'react'
import {useNavigate} from 'react-router-dom'
// import CategoriesCombo from './CategoriesCombo';

function InsertService(){

  const [types, setTypes]=useState()
    useEffect(()=>{
        if(types==null){
            axios.get("api/types")
                .then((res)=>{
                setTypes(res.data.types)
                })
        }
    },[types])

    const [serviceData, setServiceData]=useState({
      name: "",
      price: "",
      description: "",
      duration: "",
      type: "",
  })

    function handleComboBox(e){
      let newServiceData=serviceData
      newServiceData["type_id"]=e.target.value
    }

    

    function handleInput(e){
      let newServiceData=serviceData;
      newServiceData[e.target.name] = e.target.value;
      setServiceData(newServiceData)
  }

  let navigate = useNavigate()

  function handleInsertService(e){
    e.preventDefault()
    axios.post("api/services", serviceData, {headers:{'Authorization': `Bearer ${ window.sessionStorage.getItem('auth_token')}`} })
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
      <form className="Auth-form" onSubmit={handleInsertService}>
        <div className="Auth-form-content">
          <h3 className="Auth-form-title">Unesi podatke o usluzi</h3>
          <div className="form-group mt-3">
            <label>Ime</label>
            <input
              type="text"
              className="form-control mt-1"
              placeholder="Unesi ime usluge"
              onInput={handleInput}
              name="name"
            />
          </div>
          <div className="form-group mt-3">
            <label>Cena</label>
            <input
              type="number"
              step={0.01}
              className="form-control mt-1"
              placeholder="Unesi cenu"
              onInput={handleInput}
              name="price"
            />
          </div>
          <div className="form-group mt-3">
            <label>Trajanje</label>
            <input
              type="number"
              className="form-control mt-1"
              placeholder="Unesi broj dana"
              onInput={handleInput}
              name="duration"
            />
          </div>
          
          <div className="form-group mt-3">
            <label>Opis</label>
            <input
              type="text"
              className="form-control mt-1"
              placeholder="Unesi opis"
              onInput={handleInput}
              name="description"
            />
          </div>

          <div className="form-group mt-3">
            <label>Kategorija</label>
            <select onChange={handleComboBox} className='combobox' name="" id="">
            {types==null ? <></> : types.map((type)=>(
                <option key={type.id} value={type.id}>
                {type.name}
              </option>
            ))}
            </select>
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

export default InsertService