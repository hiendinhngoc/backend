import React, { useState } from 'react';
import axios from 'axios'
import logo from './logo.svg';
import './App.css';

function App() {
  const [user, setUser] = useState(null);

  const showUserInfo = () => {
    axios.get('http://localhost:3001/api/v1/users')
    .then((response: any) => {
      setUser(response.data);
    }).catch(error => console.log("calling api error ", error))
  }

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload.
        </p>
        <p>
          {JSON.stringify(user)}
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
        <button onClick={showUserInfo}>Show User</button>
      </header>
    </div>
  );
}

export default App;
