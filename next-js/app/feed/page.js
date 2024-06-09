"use client"

import { useState, useEffect } from 'react';

import '@/app/globals.css';
import './page.css';

import Card from '@/components/Card';

import Image from 'next/image';
import Logo from '@/assets/logo.png';

import "@fortawesome/fontawesome-svg-core/styles.css";
import { config } from "@fortawesome/fontawesome-svg-core";
config.autoAddCss = false;
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faArrowTrendUp, faSort, faFilter } from "@fortawesome/free-solid-svg-icons";
import { faBell, faUser } from "@fortawesome/free-regular-svg-icons";

const documentUrl = "http://localhost:3001/api/documents/";
const userUrl = "http://localhost:3001/api/users/";

const options = {
    method: "GET",
    headers: {
        "Content-Type": "application/json"
    }
};

const getUser = (userId) => {
    return fetch(userUrl + userId, options)
    .then(response => {
        if(!response.ok){
            throw new Error("Network response was not ok: " + response.status);
        }
        return response.json();
    })
    .then(data => data.username)
}

const getCard = (docId) => {
    return fetch(documentUrl + docId, options)
    .then(response => {
        if(!response.ok){
            throw new Error("Network response was not ok: " + response.status);
        }
        return response.json();
    })
    .then(data => {
        return <Card
            className="card"
            username={getUser(data.authorId)}
            n_votes={data.numOfUpvotes}
            n_comments={0}
            duration_ago="31min"
            is_bookmarked={false}
            title={data.title}
            description={data.searchableText}
        />
    })
}

const getCards = (docIds) => docIds.map(docId => getCard(docId))

const fetchCards = (docIds, setCards) => setCards(getCards(docIds))



const page = () => {
    const [cards, setCards] = useState([]);

    useEffect(() => {fetchCards([4,5,7,13,15,21,24,29,31], setCards)}, [])

    return (
        <div className="pageMain">
        <div className='top-line'>
            <Image className="logo" src={Logo} height={50} width={50} />
            <FontAwesomeIcon className='bell gray' icon={faBell} />
            <FontAwesomeIcon className='user gray' icon={faUser} />
        </div>
        <div className='search'>
            <form>
                <input type="email" name="logInEmail" id="logInEmail" placeholder='Search' className="logInEmailField"></input>
            </form>
            <FontAwesomeIcon className='filter gray' icon={faFilter} />
        </div>
        <div className="options">
            <p className='trending'>Trending</p>
            <FontAwesomeIcon className='tr-arrow gray' icon={faArrowTrendUp} />
            <FontAwesomeIcon className='sort gray' icon={faSort} />
        </div>
        <div>
            {/*<Card className="card" username="Marko Fain" n_votes={26} n_comments={16} duration_ago="31min" is_bookmarked={true} title="OE1 Laboratorijske vježbe" description="Upute za pripremu i sigurnost u laboratoriju, lorem ipsum dolor sit amet Upute za pripremu" />
            <Card className="card" username="Marko Fain" n_votes={26} n_comments={16} duration_ago="31min" is_bookmarked={true} title="OE1 Laboratorijske vježbe" description="Upute za pripremu i sigurnost u laboratoriju, lorem ipsum dolor sit amet Upute za pripremu" />
            <Card className="card" username="Marko Fain" n_votes={26} n_comments={16} duration_ago="31min" is_bookmarked={true} title="OE1 Laboratorijske vježbe" description="Upute za pripremu i sigurnost u laboratoriju, lorem ipsum dolor sit amet Upute za pripremu" />
            */}
            {cards}
        </div>
        </div>
    )
}

export default page;