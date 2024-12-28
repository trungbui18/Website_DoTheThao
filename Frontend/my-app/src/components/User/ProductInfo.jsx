import React from "react";
import { useState } from "react";
import "./ProductInfo.css";
import "bootstrap/dist/css/bootstrap.min.css";
import "bootstrap/dist/js/bootstrap.bundle.min.js";
import axios from "axios";

function ProductInfo({ price, name, productSizes, productId }) {
  const [soLuong, setSoLuong] = useState(1);
  const [selectedSize, setSelectedSize] = useState(null);
  const [soLuongKho, setSoLuongKho] = useState(1);
  const [cartId, setCartId] = useState(localStorage.getItem("cartId"));
  const tang = () => {
    if (soLuong<soLuongKho){
      setSoLuong(soLuong + 1);
    }

  };
  
  const giam = () => {
    if(soLuong<=1){
      setSoLuong(1);
    }
    else{
      setSoLuong(soLuong-1);
    }
  };
  const handleInputChange = (event) => {
    console.log(event.target.value);
    const value = parseInt(event.target.value);
    if (value >= soLuongKho) {
      setSoLuong(soLuongKho);
    } else if (value < 1) {
      setSoLuong(1);
    } else if (isNaN(value)) {
      setSoLuong("");
    } else {
      setSoLuong(value);
    }
  };
  const handleSizeChange = (Productsize) => {
    setSelectedSize(Productsize.size.id);
    setSoLuongKho(Productsize.quantity);
  };

  const token = localStorage.getItem("token");
  console.log("Token:", token);
  const userId = localStorage.getItem("userId");
  console.log("idU:", userId);

const handleAddToCart = async () => {
  if (token) {
    if (!selectedSize) {
      alert("Vui lòng chọn kích cỡ trước khi thêm vào giỏ hàng!");
      return;
    }

    if (!cartId || cartId === "null") {
      try {
        const formData = new FormData();
        formData.append("userId", parseInt(userId));

        const response = await axios.post("http://localhost:8080/api/createcart", formData);

        if (response.status !== 200) {
          console.error(`Lỗi khi tạo giỏ hàng: ${response.statusText}`);
          return;
        }

        const data = response.data;
        if (data.cartId) {
          localStorage.setItem("cartId", data.cartId);
          setCartId(data.cartId); 
          cartId = data.cartId; 
          console.log("Giỏ hàng đã được tạo, cartId:", data.cartId);
        } else {
          console.log("Không nhận được cartId từ server!");
          return;
        }
      } catch (err) {
        console.error("Lỗi khi tạo giỏ hàng:", err);
        return;
      }
    }

    const selectedSizeObj = productSizes.find(
      (Productsize) => Productsize.size.id === selectedSize
    );

    if (selectedSizeObj) {
      if (soLuong > selectedSizeObj.quantity) {
        alert("Sản phẩm hiện tại hết hàng!");
        setSoLuong(selectedSizeObj.quantity);
      } else {
        try {
          const formData = new FormData();
          formData.append("price", price);
          formData.append("quantity", soLuong);
          formData.append("productId", productId);
          formData.append("cartId", cartId);
          formData.append("sizeId", selectedSize);

          console.log("idC:", cartId);
          console.log("idP:", productId);
          console.log("idU:", userId);
          console.log("price", price);
          console.log("sL:", soLuong);
          console.log("size", selectedSize);

          const response = await axios.post(
            "http://localhost:8080/api/addcartdetails",formData);
          if (response.status !== 200) {
            console.error("Lỗi khi thêm vào giỏ hàng:", response.statusText);
            return;
          }
          alert("Đã thêm sản phẩm vào giỏ hàng!");
        } catch (err) {
          console.error("Lỗi kết nối đến server:", err);
          alert("Lỗi kết nối đến server!");
        }
      }
    }
  } else {
    alert("Vui lòng đăng nhập để thêm vào giỏ hàng!");
  }
}

  return (
    <div className="product-info">
      <h2>{name}</h2>
      <p>Giá: {price} VND</p>
      <div className="size">
        <div>Kích Cỡ:</div>
        <div className="btn-group" role="group" aria-label="Size selection">
          {productSizes.map((ListSize) => (
            <button
              key={ListSize.size.id}
              type="button"
              className={`btn btn-outline-primary ${selectedSize === ListSize.size.id ? "active" : ""}`}
              onClick={() => handleSizeChange(ListSize)}
              disabled={ListSize.quantity === 0}
            >
              {ListSize.size.description}
            </button>
          ))}
        </div>
      </div>
      <div className="soLuong">
        <label>Số lượng: </label>
        <button onClick={giam}>-</button>
        <input
          value={soLuong}
          onChange={handleInputChange}
          style={{ width: "50px", textAlign: "center" }}
          max={soLuongKho}
        />
        <button onClick={tang}>+</button>
      </div>
      <button className="btn btn-primary" onClick={handleAddToCart}>
        Thêm vào giỏ hàng
      </button>
    </div>
  );
}

export default ProductInfo;
