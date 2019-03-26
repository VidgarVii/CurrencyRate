import React from "react"
import PropTypes from "prop-types"
import CurrencyList from "./CurrencyList";
class CurrencyPair extends React.Component {
  constructor () {
    super();
    this.state = {
      visiblyList: true,
    };
    this.toggleVisibly = this.toggleVisibly.bind(this);
  }

  toggleVisibly () {
    this.setState(state => ({
      visiblyList: !state.visiblyList
    }));
    console.log(this.state.visiblyList)
  }

  render () {
    return (
      <div className="currency">
        <span onClick={this.toggleVisibly} className="currency__code"> { this.props.code }</span>
        <span className="currency__price"> { this.props.price } { this.props.sign }</span>
        <CurrencyList pairList={this.props.pairList}/>
      </div>
    );
  }
}

CurrencyPair.propTypes = {
  price:    PropTypes.number,
  sign:     PropTypes.string,
  code:     PropTypes.string,
  pairList: PropTypes.array
};
export default CurrencyPair
