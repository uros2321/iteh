import React from 'react'
import {useState, useEffect} from 'react'
import axios from 'axios';
import OneUsage from './OneUsage';

function Usages({token}){

    let header= {
        headers: {'Authorization': "Bearer " + token}
      };
      
      const [usages, setUsages]=useState();
      useEffect(()=>{
        if(usages==null){
            axios.get("api/usages", header).then((res)=>{
                console.log(res.data);
                setUsages(res.data.usages);
            });
        }
      },[usages]);


return (
<>
<div className='centerAreaUsages'>
    <h1 className='text1'>Trenutna korišćenja usluga</h1>
</div>
<div className="usages-body">
                {usages==null ? <></> :  usages.map((usage)=>(
                    <OneUsage  usage={usage} key={usage.id} />
                ))}
            </div>
</>

);
}

export default Usages