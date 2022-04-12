import React from 'react';
// import PropTypes from 'prop-types';

const Nav = () => {

  return (
  
    <nav className='navbar' id='nav'>
      <div className='container'>
        <div className='logo'>Plebis</div>
          <ul className='nav'>
              <li href="#"><a>Dogecoin RPC</a></li>
              <li href="#"><a>Blog</a></li>
          </ul>
      </div>
    </nav>

  );
};

// Scoreboard.propTypes = {
//   score: PropTypes.number,
// }

export default Nav;
