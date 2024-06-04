const convertISOToDateTime = (isoString) => {
    let date = new Date(isoString);

    // Lấy các thành phần ngày, tháng, năm, giờ, phút, giây
    let year = date.getUTCFullYear();
    let month = String(date.getUTCMonth() + 1).padStart(2, '0'); // Tháng được tính từ 0-11
    let day = String(date.getUTCDate()).padStart(2, '0');
    let hours = date.getUTCHours() + 7; // Cộng thêm 7 giờ để điều chỉnh múi giờ
    let minutes = String(date.getUTCMinutes()).padStart(2, '0');
    let seconds = String(date.getUTCSeconds()).padStart(2, '0');

    // Xử lý trường hợp giờ vượt quá 24
    if (hours >= 24) {
        hours -= 24;
        day = String(Number(day) + 1).padStart(2, '0'); // Tăng ngày lên 1
    }
    hours = String(hours).padStart(2, '0');

    // Tạo chuỗi định dạng yyyy-mm-dd hh:mm:ss
    let formattedDate = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;

    return formattedDate;
};
module.exports = convertISOToDateTime;
