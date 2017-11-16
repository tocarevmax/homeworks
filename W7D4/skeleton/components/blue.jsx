import React from 'react';
import { Route, Link, NavLink } from 'react-router-dom';
import Indigo from './indigo';


class Blue extends React.Component {
  render() {
    return (
      <div>
        <h2 className="blue"></h2>
        {
          <div>
            <NavLink exact to='/blue' >Blue only</NavLink>
            <NavLink exact to='/blue/indigo' >Add indigo</NavLink>
          </div>
        /* Links here */
        }

        {
          <Route path="/blue/indigo" component={Indigo} />

        /* Routes here */
        }
      </div>
    );
  }
};

export default Blue;
