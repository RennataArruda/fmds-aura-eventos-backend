import moment from 'moment';

const convertData = (data) => {
    return moment(data).format('YYYY-MM-DD');
}

const convertDataHora = (data) => {
    return  moment(data).toISOString();
}


const booleanToNumber = (value) => {
    return value ? 1 : 0;
}

const numberToBoolean = (value) => {
    return value === 1;
}

export default {
    convertData,
    convertDataHora,
    booleanToNumber,
    numberToBoolean
}