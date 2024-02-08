import React from 'react'

function ProfilePage({currentUser}){
    return (
    <>
        <div className='profilePage'>
            <p className='name'><b>Ime:</b> {currentUser.firstname}</p>
            <p className='lastname'><b>Prezime:</b> {currentUser.lastname}</p>
            <p className='email'><b>Email:</b> {currentUser.email}</p>
            <p className='type'><b>Kategorija: </b>{currentUser.category.name}</p>
            <p className='type'><b>Datum rodjenja:</b> {currentUser.birthday}</p>
        </div>
    </>

    );
}

export default ProfilePage