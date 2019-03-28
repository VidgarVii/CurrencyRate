import React from "react"
import PropTypes from "prop-types"
class CurrencyPair extends React.Component {
  constructor () {
    super();
    this.state = {
      visiblyList: true,
      list: this.props.pairs,
    };
    this.toggleVisibly = this.toggleVisibly.bind(this);
  }

  render () {
    return (
        <p>
          Pair: {this.props.pairs.pair}
        </p>
    );
  }
}

CurrencyPair.defaultProps = {
  pairs: []
};


CurrencyPair.propTypes = {
  pairs: PropTypes.node
};
export default CurrencyPair
