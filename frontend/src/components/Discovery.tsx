import React, { useState, useMemo } from 'react';
import axios from 'axios';
import TinderCard from 'react-tinder-card';
import { ActionCableConsumer } from 'react-actioncable-provider';

interface User {
  id: number,
  first_name: string,
  last_name: string,
  age: number,
  image: string,
}

interface UserProps {
  initialUsers: User[]
}

const Discovery: React.FC<UserProps> = ({ initialUsers }) => {
  const [users, setUsers] = useState(initialUsers);
  const alreadyRemoved: number[] = [];
  let usersState = initialUsers;

  const childRefs = useMemo(() => Array(initialUsers.length).fill(0).map( () => React.createRef<any>()), [])

  const swiped = (direction: string, idTodelete: number) => {
    if (direction === "left") {
      axios.post<string>(`http://localhost:3001/api/v1/user/pass/${idTodelete}`)
        .then((response) => {
          return response.data;
        }).catch(error => console.log("calling pass API error ", error))
    } else if (direction === "right") {
      axios.post<string>(`http://localhost:3001/api/v1/user/like/${idTodelete}`)
        .then((response) => {
          return response.data;
        }).catch(error => console.log("calling like API error ", error))
    }
    alreadyRemoved.push(idTodelete);
  }

  const outOfFrame = (id: number) => {
    usersState = usersState.filter( user => user.id !== id);
    setUsers(usersState);
  }

  const swipe = (dir: string) => {
    const cardsLeft = users.filter( user => !alreadyRemoved.includes(user.id));

    if (cardsLeft.length) {
      const toBeRemoved = cardsLeft[cardsLeft.length - 1].id;
      const index: number = initialUsers.map(user => user.id).indexOf(toBeRemoved);
      alreadyRemoved.push(toBeRemoved);
      childRefs[index].current.swipe(dir);
    }
  }

  const handleNotification = response => {
    console.log(response.data);
  }

  return (
    <div>
      <div className="cardContainer">
        {
          users.map((user, index) => 
            <TinderCard 
              ref={childRefs[index]}
              className="swipe"
              key={user.id}
              onSwipe={(dir) => swiped(dir, user.id)}
              onCardLeftScreen={() => outOfFrame(user.id)}>
                <div style={{ backgroundImage: 'url('+ user.image +')' }} className="card">
                  <h3>{user.first_name} {user.last_name}, {user.age}</h3>
                </div>
            </TinderCard>
          )
        }
      </div>
      <ActionCableConsumer
        channel={{channel: 'NotificationChannel'}}
        onReceive={handleNotification}
      />
      {/*<div className="buttons" id="actions">
        <button onClick={() => swipe('left')}>Pass</button>
        <button onClick={() => swipe('right')}>Like</button>
      </div>*/}
    </div>
  );
}

export default Discovery;
