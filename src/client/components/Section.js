
import React, { useState } from 'react';
import PropTypes from 'prop-types';
import 'antd/dist/antd.css'
import { Drawer } from 'antd';
// const {  Drawer, Button  } = antd;

const Section = props => {
   const { commands, currentCategory, commandSearch, showDrawer, commandClose, visible, drawerObject} = props;
   
   let newCommands = commands;
  if (currentCategory.currentCategory) {
    newCommands = commands.filter(command => command.categories_id === currentCategory.currentCategory)
  }else if(commandSearch){
    // newCommands = commands.filter(command => )
    newCommands = commands.filter(command =>command.command.toLowerCase().includes(commandSearch.toLowerCase()))
  }
  
  return (
    <>
      <section className="boxes">
          <div className="container">
          { newCommands.map((command)=> (
            <div key={command.commands_id} onClick={() => showDrawer({drawerObject: command})} className="box">
                <h4><i className="fas fa-mobile"></i>{command.command}</h4>
                <p>{command.description} </p>
            </div>
          ))
          }
          {
            <Drawer title={drawerObject.command} placement="right" onClose={() => commandClose()} visible={visible}>
            <h2>{drawerObject.argument}</h2>
            <p>{drawerObject.description}</p>
            {/* <p>Some contents...</p> */}
           </Drawer>}
          </div>
      </section>
      
    </>
  );
};

Section.propTypes = {
  commands: PropTypes.array,
  currentCategory: PropTypes.object,
  selectedCategory: PropTypes.func,
  commandSearch: PropTypes.string
}

export default Section;