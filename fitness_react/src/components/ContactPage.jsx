
import React, { useState, useEffect } from "react";
import axios from "axios";



function ContactPage(){

    const [latitude, setLatitude] = useState("");
  const [longitude, setLongitude] = useState("");
  const [mapImage, setMapImage] = useState("");

  useEffect(() => {
    const fetchData = async () => {
      const response = await axios.get(
        `https://nominatim.openstreetmap.org/search?q=Kumodraska+17,+Beograd,+Srbija&format=json`
      );
      if (response.data && response.data.length > 0) {
        setLatitude(response.data[0].lat);
        setLongitude(response.data[0].lon);
      }
    };
    fetchData();
  }, []);

  useEffect(() => {
    const fetchData = async () => {
      const response = await axios.get(
        `https://www.mapquestapi.com/staticmap/v5/map?key=6IeLvz6vkLp08dN6M9PVthl9kloq73bs&size=600,400&center=${latitude},${longitude}&locations=${latitude},${longitude}&options=marker-red`
      );
      setMapImage(response.config.url);
    };
    if (latitude !== "" && longitude !== "") {
      fetchData();
    }
  }, [latitude, longitude]);

        
      
        



    return (
    <> <div className='centerArea1'>
    <h1 className='text1'>Kontakt</h1>
</div>

<div className='centralTextDiv'>
    <p className='centralText'></p>
    <h4>Power Gym</h4> 
    <br></br>
<p>Kontakt telefon: 011/354 91 91</p>
<p>Adresa: Kumodraška 17, Voždovac</p>
<p>Email: powergym@gmail.com</p>
<p>Radno vreme: 07:00 - 23:00</p>
<div className="mapa">
<img src={mapImage} alt="map" />
</div>
    
</div>
    

    </>

    );
}

export default ContactPage