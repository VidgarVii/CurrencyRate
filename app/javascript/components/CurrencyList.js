import React from "react"
import PropTypes from "prop-types"
class CurrencyList extends React.Component {
  render () {
    return (
        <React.Fragment>
         <RenderList items={ this.props.pairList } />
        </React.Fragment>
    );
  }
}

CurrencyList.propTypes = {
  pairList: PropTypes.array
};

function RenderList (props) {
  const currencyList = props.items;
  const listItems = currencyList.map((item) =>
    <li key={item.toString()} >{ item }</li>
  );
  return(
    <ul className='currency-list'> { listItems } </ul>
  )
}

export default CurrencyList
