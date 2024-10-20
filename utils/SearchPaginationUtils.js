const montarCommonPagination = (searchOptions, sqlQuery) => {
    if (searchOptions.sortKey && searchOptions.sortOrder){
        sqlQuery += ` ORDER BY ${searchOptions.sortKey} ${searchOptions.sortOrder}`;
    } else {
        sqlQuery += ` ORDER BY dataEvento ASC`;
    }

    const page = searchOptions.page || 1;
    const limit = searchOptions.limit || 10;
    const offset = (page - 1) * limit;
    sqlQuery += ` LIMIT ${limit} OFFSET ${offset}`;
    return sqlQuery;
}

export default {
    montarCommonPagination
}