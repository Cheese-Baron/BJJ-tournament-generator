import React from 'react';

import BackButton from '../components/BackButton';

class WaitingTournamentTile extends React.Component {
  constructor(props){
    super(props);
    this.state = {

    };
  }

  componentDidMount(){
  }

  render(){

    let tournamentSpots, entrants;

    if(this.props.entrants.length != 0){
      entrants = this.props.entrants.map((entrant) => {
        return(
          <h4 key={entrant.id}>{entrant.first_name}</h4>
        )
      })
    }

    if(this.props.entrants.length != 8){
      tournamentSpots = <h2>{ 8 - this.props.entrants.length} Spots Left to Fill!</h2>
    } else {
      tournamentSpots = <h2>Tournament Filled!</h2>
    }

    return(
      <div>
        <h2>Entrants</h2>
        {entrants}
        {tournamentSpots}
        {this.props.signUpButton}
        <BackButton
        />
      </div>
    )
  }
}

export default WaitingTournamentTile;
