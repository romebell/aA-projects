// let parent = document.getElementById('parent');
// let child = 

// click_count.jsx folder
import React from 'react';
import Counts from './counts';

class ClickCounter extends React.Component {
  constructor(props) {
    super(props);
    this.state = { count: 0, previousCounts: [] };
  }

  click(event) {
    event.preventDefault();
    this.setState({count: this.state.count + 1});
  }

  reset(event) {
    event.preventDefault();
    const previousCounts = this.state.previousCounts;
    previousCounts.push(this.state.count); 
    this.setState( { count: 0, previousCounts });
  }
  
  render() {
    return (
      <div>
        <button onClick={this.click.bind(this)}>Click Me!!!</button>
        <span>{this.state.count}</span>
        <br />
        <button onClick={this.reset.bind(this)}>Reset!</button>
        <Counts previousCounts={this.state.previousCounts}/>
      </div>
    );
  }
}


export default ClickCounter;

// index.html file. rough sketch
<html>
  <head>
    <script src="bundle.js"></script>
  </head>
  <body>
    <div id="root">
    React will take over
    </div>
  </body>
</html>

// entry.jsx file
import React from 'react';
import ReactDOM from 'react-dom';

import ClickCounter from './click_counter';

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById('root');
  ReactDOM.render(<ClickCounter />, root);
}); 


// inside counts.jsx
import React from 'react';

// class Counts extends React.Component {
//   constructor(props) {
//     super(props);
//   }

//   render() {
//     return (
//       <ul>
//       {
//         this.props.previousCounts.map( count => <li>{count}</li>)
//       }
//     </ul>
//     )
//   }
// }

// another efficient way to do it with ES6. Calling this on the window
// no need to call this.
const Counts = ({ previousCounts }) => (
  <ul>
      {
        previousCounts.map( (count, index) => <li key={idx}>{count}</li>)
      }
    </ul>
)

export default Counts;


// move click_count and counts into folder
// 