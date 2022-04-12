
import React from 'react';
import PropTypes from 'prop-types';


const Header = props => {
  const {categories, currentCategory, selectedCategory, searchCategory} = props;
  return (
  
    <header className="header">
        <div className="container">
        <div  className="list-group">
          <label >Filter by category:</label>
            <select onChange={(event) => selectedCategory({currentCategory: Number(event.target.value)})} name='categories'>
              <option>All</option>
                {
                categories.map((category)=> (
                  <option key={category.categories_id} value={category.categories_id}>{category.category}</option>
                  ))
                }
            </select>
        </div>
        <div>
          <label>Search by command:</label>
            <input
              type='text'
              placeholder='backupwallet'
              onChange={(e)=> searchCategory(e.target.value)}
            >
            </input>
        </div>
      </div>  
    </header> 

  );
};

Header.propTypes = {
  categories: PropTypes.array,
  currentCategory: PropTypes.object,
  selectedCategory: PropTypes.func,
  searchCategory: PropTypes.func,
}
export default Header;