import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Orange from './orange';
import Yellow from './yellow';

class Red extends React.Component {
  render() {
    return(
      <div>
        <h2 className="red"></h2>
        {
          <div>
            <NavLink exact to="/red">Red only</NavLink>
            <NavLink exact to="/red/orange">add Orange</NavLink>
            <NavLink exact to="/red/yellow">add Yellow</NavLink>
          </div>
        /* Links here */
        }

        {
          <div>
            <Route path="/red/orange" component={Orange} />
            <Route path="/red/yellow" component={Yellow} />
          </div>
        /* Routes here */
        }
      </div>
    );
  }
};

export default Red;
