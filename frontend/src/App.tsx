import React, { useState, useEffect } from 'react';
import axios from 'axios';
import Discovery from './components/Discovery';
import Favoriting from './components/Favoriting';
import './App.css';

interface User {
  id: number,
  first_name: string,
  last_name: string,
  age: number,
  image: string,
}

function App() {
  const [initialUsers, setInitialUsers] = useState<User[]>([]);
  const [loading, setLoading] = useState(true);
  const [isDiscovery, setIsDiscovery] = useState(true);
  const [isFavoriting, setIsFavoriting] = useState(false);
  // const [isMatching, setIsMatching] = useState(false);

  const getUsers = async () => {
    await axios.get<User[]>('http://localhost:3001/api/v1/users')
    .then((response) => {
      setInitialUsers(response.data);
      setLoading(false);
    }).catch(error => console.log("calling get list users error ", error))
  }

  useEffect(() => {
    getUsers()
  }, []);

  const handleOpenDiscovery = () => {
    setIsDiscovery(true);
    setIsFavoriting(false);
  }

  const handleOpenFavoriting = () => {
    setIsDiscovery(false);
    setIsFavoriting(true);
  }

  if(loading) { return <div>Loading...</div>}

  return (
    <div className="app">
      {isDiscovery && <Discovery initialUsers={initialUsers} />}
      {isFavoriting && <Favoriting />}
      <div className="buttons">
        <button onClick={handleOpenFavoriting}>Favoriting</button>
        <button onClick={handleOpenDiscovery}>Discover</button>
        <button onClick={undefined}>Matches</button>
      </div>
    </div>
  );
}

export default App;
