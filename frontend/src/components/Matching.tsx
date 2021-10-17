import React, { useEffect, useState } from 'react';
import axios from 'axios';

interface User {
  id: number,
  first_name: string,
  last_name: string,
  age: number,
  image: string,
}

const Matching: React.FC = () => {
  const [matching, setMatching] = useState<User[]>([])

  const getMatchings = async () => {
    await axios.get<User[]>('http://localhost:3001/api/v1/user/matching')
    .then((response) => {
      setMatching(response.data);
    }).catch(error => console.log("calling get list matching error ", error))
  }

  useEffect(() => {
    getMatchings()
  }, []);

  return (
    <table className="list-matches">
      { 
        matching.map((user, index) =>
          <tr key={index} className="matching">
            <th className="avatar" style={{ backgroundImage: 'url('+ user.image +')' }} ></th>
            <th>{user.first_name} {user.last_name}, {user.age}</th>
          </tr>
        )
      }
    </table>
  );
}

export default Matching;
