

import React from 'react'
import {useState} from 'react'
import axios from 'axios'
import {BsCurrencyExchange} from "react-icons/bs"

function OneService({service, token, createUsage, usages}){
    let activated = false
    if(token!=null && usages!=null){
        usages.map((usage)=>{
        if(usage.service.id === service.id){
            activated=true
        }
        })
    }

  const [amount, setAmount] = useState(service.price.toFixed(2));
  const [currency, setCurrency] = useState("RSD");

  const changeCurrency = () => {
    if(currency == "RSD"){
      const options = {
        method: 'GET',
        url: 'https://api.currencyapi.com/v3/latest?apikey=MsL8RyxxwkC73lbdR88WyaXwEXUWrxfcCbXObLxT&base_currency=RSD&currencies=EUR',
        };
    
        axios.request(options).then(function (response) {
            console.log(response);
            setAmount((response.data.data.EUR.value*amount).toFixed(2));
            setCurrency("EUR");
    
        }).catch(function (error) {
            console.error(error);
        });
    }else{
      const options = {
        method: 'GET',
        url: 'https://api.currencyapi.com/v3/latest?apikey=MsL8RyxxwkC73lbdR88WyaXwEXUWrxfcCbXObLxT&base_currency=EUR&currencies=RSD',
        };
    
        axios.request(options).then(function (response) {
            console.log(response.data);
            setAmount((response.data.data.RSD.value*amount).toFixed(2));
            setCurrency("RSD");
        }).catch(function (error) {
            console.error(error);
        });
    }
  }

    return (
    <>
        <div className='service'>
            <div className='name'>{service.name}</div>
            <div className='description'>{service.description}</div>
            <div className='img'><img src="https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png" alt="" className='imgService'/></div>
            <div className='grupa1'>
            <div className='price'>Cena: {amount+" "+currency} <button className="currency-button" onClick={changeCurrency}>
              <BsCurrencyExchange />
            </button></div>            
            <div className='duration'>{service.duration} dana</div>
            </div>
            <div className='type'>Tip: {service.type.name}</div>
            {token!=null ? (!activated ? <div  className='buttonDiv'><button onClick={()=>{createUsage(service.id, service.duration)}} className='activate'>Aktiviraj</button></div> :
                <div  className='acitaved-service'><p className='textAct'>Usluga je vec aktivirana</p></div> ) : <></>}
        </div>
        
    </>

    );
}

export default OneService