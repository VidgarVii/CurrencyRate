import React from "react"
import PropTypes from "prop-types"
class CurrencyPair extends React.Component {
  render () {
    return (
      <React.Fragment>
        <div className="currency">
          <span className="currency__code"> { this.props.code }</span>
          <span className="currency__price"> { this.props.price } { this.props.sign }</span>
        </div>
      </React.Fragment>
    );
  }
}

CurrencyPair.propTypes = {
  price: PropTypes.number,
  sign:  PropTypes.string,
  code:  PropTypes.string
};
export default CurrencyPair
