import React, { useEffect, useState } from 'react';
import axios from 'axios';

interface User {
  id: number,
  first_name: string,
  last_name: string,
  age: number,
  image: string,
}

const Favoriting: React.FC = () => {
  const [favoriting, setFavoriting] = useState<User[]>([])

  const getFavoritings = async () => {
    await axios.get<User[]>('http://localhost:3001/api/v1/user/favoriting')
    .then((response) => {
      setFavoriting(response.data);
    }).catch(error => console.log("calling get list favoriting error ", error))
  }

  useEffect(() => {
    getFavoritings()
  }, []);

  return (
    <div className="grid-container">
      { 
        favoriting.map((user, index) =>
          <div key={index} className="grid-item" >
            <div style={{ backgroundImage: 'url('+ user.image +')' }} className="card-favoriting">
              <h3>{user.first_name} {user.last_name}, {user.age}</h3>
            </div>
          </div>
        )
      }
    </div>
  );
}

export default Favoriting;
