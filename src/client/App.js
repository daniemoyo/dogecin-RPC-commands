import React, { Component } from 'react';
import './styles/app.css';
import Nav from './components/Nav';
import Header from './components/Header';
import Section from './components/Section';
import Footer from './components/Footer';
import 'antd/dist/antd.css'
import { Drawer } from 'antd';

export default class App extends Component {
  constructor(props){
    super(props);

    this.state = { 
      categories: [],
      commands: [],
      commandSearch: null,
      currentCategory: {},
      currentCommand:{},
      drawerObject: {},
      visible: false,
      setVisible: false
      
    };
    
    this.showDrawer = this.showDrawer.bind(this);
    this.commandClose = this.commandClose.bind(this);
    this.selectedCategory = this.selectedCategory.bind(this);
    this.selectedCommand = this.selectedCommand.bind(this);
    this.searchCategory = this.searchCategory.bind(this);
  }
   


  showDrawer = (drawerObject) => {
    this.setState({ drawerObject: drawerObject.drawerObject})
    this.setState({ setVisible: true})
    this.setState({ visible: true})
   }

  commandClose = () => {
    this.setState({ visible: false})
  }

  selectedCategory(currentCategory){
    this.setState({ currentCategory: currentCategory})
  }
  selectedCommand(currentCommand){
    this.setState({ currentCommand: currentCommand})
  }

  searchCategory(userSearch){
    this.setState({ commandSearch: userSearch})
  }
  componentDidMount() {
    fetch('/api/categories')
      .then(res => res.json())
      .then(data => this.setState({ categories: data }));

      fetch('/api/commands')
      .then(res => res.json())
      .then(data => this.setState({ commands: data })); 
      
      // fetch('/api/arguments')
      // .then(res => res.json())
      // .then(data => this.setState({ arguments: data }));
  }

  render() {
   
    return (
      <>
      {<Nav />}
      {<Header 
        categories={this.state.categories}
        currentCategory={this.state.currentCategory}
        selectedCategory={this.selectedCategory}
        searchCategory={this.searchCategory}
      />}
      {<Section 
        commands={this.state.commands} 
        currentCategory={this.state.currentCategory}
        commandSearch={this.state.commandSearch}
        visible={this.state.visible}
        drawerObject={this.state.drawerObject}
        showDrawer={this.showDrawer}
        commandClose={this.commandClose}
        
      />}
      {<Footer />}
      
      </>
    );
  }
}
