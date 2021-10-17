import React, { useState, useEffect } from 'react';
import axios from 'axios';
import Discovery from './components/Discovery';
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

  if(loading) { return <div>Loading...</div>}

  return (
    <div className="app">
      <Discovery initialUsers={initialUsers} />
    </div>
  );
}

export default App;
