import moment from 'moment';

const convertData = (data) => {
  return moment(data).format('YYYY-MM-DD');
}

export default convertData;
