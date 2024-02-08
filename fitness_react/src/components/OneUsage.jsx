import React from 'react'

function OneUsage({usage}){

    let today = new Date()
    let dateTo = new Date(usage.date_to)
    let differenceTime = dateTo.getTime()-today.getTime()
    let differenceDays = Math.floor(differenceTime / (1000 * 60 * 60 * 24));


return (
<>
    {differenceDays > 0 ? (<div className='usages'>
            <div className='name'>{usage.service.name}</div>
            <div className='description'>{usage.service.description}</div>
            <div className='img'><img src="https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png" alt="" className='imgService'/></div>
            <div className='started'>Od {usage.date_from} do {usage.date_to}</div>            
            <div className='durationleft'><p className='active-usage'>Aktivno još: {differenceDays} dana</p></div> 
        </div>) : (<div className='usages-out'>
            <div className='name'>{usage.service.name}</div>
            <div className='description'>{usage.service.description}</div>
            <div className='img'><img src="https://www.hussle.com/blog/wp-content/uploads/2020/12/Gym-structure-1080x675.png" alt="" className='imgService'/></div>
            <div className='started'>{usage.date_from} - {usage.date_to}</div>            
            <div className='durationleft'><p className='active-usage'>Usluga je istekla!</p></div> 
            <div className='buttonDiv'><button className='activate'>Obriši</button></div>
        </div>)}
</>

);
}

export default OneUsage